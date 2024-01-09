`timescale 1ns/1ns
module tb();
    logic start = 0, clk = 0;
    logic[15:0] x = 16'h010c;
    logic[7:0] in_y = 8'b0;
    wire[15:0] out_ans;
    wire done;

    ca6 UUT (start,
             clk,
             x,
             in_y,
             out_ans,
             done);

    always #100 clk = ~clk;

    initial begin
        #110 start = 1;
        #440 start = 0;
    end
endmodule