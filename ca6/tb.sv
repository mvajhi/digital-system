`timescale 1ns/1ns
module tb();
    ca6 UUT (start,
             clk,
             x,
             in_y,
             out_ans);
    logic start = 0, clk = 0;
    logic[15:0] x = 16'b0001 0000;
    logic[7:0] in_y = 16'b0000 0000;
    wire[7:0] out_ans;

    always #100 clk = ~clk;

    initial begin
        start = 1;
        #300 start = 0;
    end
endmodule