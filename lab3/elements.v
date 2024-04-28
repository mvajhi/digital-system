module Counter8bit (
    input wire clk,
    input wire reset,
    output reg [7:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 8'b0;
        else
            count <= count + 1;
    end

endmodule

module Waveform_Generator (
    input wire clk,
    input wire reset,
    input wire [2:0] func,
    output reg [7:0] out
);
    wire [7:0] count;
    Counter8bit counter (
        .clk(clk),
        .reset(reset),
        .count(count)
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
            // //DDS-Sine
            // 3'b100: begin
            //     out <= 8'd128 + 8'd127 * sin(count);
            // end
            // default: 
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
        .init_value({~init + 1, 4'b0110}),
        .count(count),
        .carry(carry)
    );
    
    assign out = carry;
endmodule

module TopModule (
    input wire clk,
    input wire reset,
    input wire freq_load,
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

    AMP_Selector amp_sel (
        .reset(reset),
        .amp_in(waveform_out),
        .amp_out(out)
    );

    Waveform_Generator waveform_gen (
        .clk(freq_sel_out),
        .reset(reset),
        .func(func),
        .out(waveform_out),
    );
endmodule