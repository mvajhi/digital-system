module Waveform_Generator (
    input wire clk,
    input wire reset,
    input wire [2:0] func,
    output reg [7:0] out
);
    wire [7:0] count;
    wire co;
    Counter8bit counter (
        .clk(clk),
        .rst(reset),
        .count(count),
        .carry(co)
    );

    //DDS
    wire [8:0] dds_out;
    DDS dds (
        .clk(clk),
        .rst(reset),
        .out(dds_out)
    );


    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 8'b0;
        else case (func)
            //Reciprocal
            3'b000: begin
                out <= 8'd255 / (8'd255 - count);
            end
            //Square
            3'b001: begin
                if (count <= 8'd127)
                    out <= 8'd255;
                else
                    out <= 8'b0;
            end
            //Triangle
            3'b010: begin
                if (count <= 8'd127)
                    out <= (count << 1);
                else
                    out <= 9'd511 - (count << 1);
            end
            //Trapezius
            3'b011: begin
                if (count <= 8'd63)
                    out <= count << 2;
                else if (count <= 8'd192)
                    out <= 8'd255;
                else
                    out <= 9'd1024 - count << 2;
            end
            //DDS-Sine
            3'b100: begin
                out <= dds_out;
            end
            //DDS-full-wave-rectified
            3'b101: begin
                out <= dds_out[7:0] < 8'd127 ? 9'd256 - dds_out[7:0] : dds_out[7:0];
            end
            //DDS-half-wave-rectified
            3'b110: begin
                out <= dds_out[7:0] < 8'd127 ? 8'd127 : dds_out[7:0];
            end
        endcase
    end

endmodule

module AMP_selector (
    input wire [7:0] data_in,
    input wire [1:0] shift_amount,
    output reg [7:0] data_out
);
    always @(data_in, shift_amount) begin
        case (shift_amount)
            2'b00: data_out <= data_in;     // No shift
            2'b01: data_out <= data_in >> 1;  // Shift by 1
            2'b10: data_out <= data_in >> 2;  // Shift by 2
            2'b11: data_out <= data_in >> 3;  // Shift by 3
        endcase
    end
endmodule

module Counter9bit (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [8:0] init_value,
    output reg [8:0] count,
    output carry
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 9'b0;
        else if (load)
            count <= init_value;
        else
            count <= count + 1;
    end
    assign carry = &count;
endmodule

module Frequency_Selector (
    input wire clk,
    input wire reset,
    input wire freq_load,
    input wire[4:0] init ,
    output wire out
);
    wire [8:0] count;
    wire carry;
    Counter9bit counter (
        .clk(clk),
        .reset(reset),
        .load(freq_load | carry),
        .init_value({~init + 1'b1, 4'b0110}),
        .count(count),
        .carry(carry)
    );
    
    assign out = carry;
endmodule

module TopModule (
    input wire clk,
    input wire reset,
    input wire freq_load,
    input wire [1:0] shift_amount,
    input wire [4:0] freq_in,
    input wire [2:0] func,
    output wire [7:0] out
);
    wire freq_sel_out;
    wire [7:0] waveform_out;

    Frequency_Selector freq_sel (
        .clk(clk),
        .reset(reset),
        .freq_load(freq_load),
        .init(freq_in),
        .out(freq_sel_out)
    );

   AMP_selector amp_sel (
        .shift_amount(shift_amount),
        .data_in(waveform_out),
        .data_out(out)
    );

    Waveform_Generator waveform_gen (
        .clk(freq_sel_out),
        .reset(reset),
        .func(func),
        .out(waveform_out)
    );
endmodule

module DDS (
    input clk,
    input rst,
    output reg [8:0] out
);
    wire [5:0] addr;
    wire phase_pos;
    wire sign_bit;
    Phase_Accumulator phase_accumulator (
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .phase_pos(phase_pos),
        .sign_bit(sign_bit)
    );
    reg [7:0] ROM [0:63];
    initial begin
        $readmemb("sine.mem", ROM);
    end

    wire [5:0] addr_ROM = phase_pos ? ~addr + 1'b1 : addr;
    wire [7:0] data_ROM = ROM[addr_ROM];

    wire [8:0] row_data = (~|addr & phase_pos) ? 8'b11111111 : data_ROM;
    assign out = (row_data > 8'd127) & sign_bit ? 9'd256 - row_data : {1'b0, row_data};
endmodule

module Phase_Accumulator (
    input clk,
    input rst,
    output reg [5:0] addr,
    output reg phase_pos,
    output reg sign_bit
);
    wire [5:0] count;
    wire carry;
    Counter6bit counter (
        .clk(clk),
        .rst(rst),
        .count(count),
        .carry(carry)
    );
    assign addr = count;
    // 4 state more machine
    reg [1:0] ps;
    reg [1:0] ns;

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= 2'b00;
        else
            ps <= ns;
    end

    always @(carry) begin
        case (ps)
            2'b00: ns = carry ? 2'b01 : 2'b00;
            2'b01: ns = carry ? 2'b10 : 2'b01;
            2'b10: ns = carry ? 2'b11 : 2'b10;
            2'b11: ns = carry ? 2'b00 : 2'b11;
        endcase
    end

    always @(ps) begin
        case (ps)
            2'b00: begin
                phase_pos = 1'b0;
                sign_bit = 1'b0;
            end
            2'b01: begin
                phase_pos = 1'b1;
                sign_bit = 1'b0;
            end
            2'b10: begin
                phase_pos = 1'b0;
                sign_bit = 1'b1;
            end
            2'b11: begin
                phase_pos = 1'b1;
                sign_bit = 1'b1;
            end
        endcase
    end
endmodule

module Counter6bit (
    input clk,
    input rst,
    output reg [5:0] count,
    output reg carry
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 6'b0;
        else
            count <= count + 1'b1;
    end
    assign carry = &count;
endmodule

module Counter8bit (
    input clk,
    input rst,
    output reg [7:0] count,
    output reg carry
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 8'b0;
        else
            count <= count + 1'b1;
    end
    assign carry = &count;
endmodule

module PWM (
    input clk,
    input rst,
    input [7:0] in,
    output out
);

    wire [7:0] count;
    wire carry;
    Counter8bit counter (
        .clk(clk),
        .rst(rst),
        .count(count),
        .carry(carry)
    );
    assign out = in > count;
endmodule