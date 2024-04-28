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

