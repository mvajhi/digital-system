`timescale 1ns/1ns
module tb_qa();
    logic in, clk = 0, rst = 0;
    wire [1:0] out;
    
    pre_qa pre_sqd(.in(in), .clk(clk), .rst(rst), .find(out[0]));
    qa sqd(.in(in), .clk(clk), .rst(rst), .find(out[1]));

    wire diff;
    assign diff = ^out;

    always #100 clk = ~clk;
    initial begin
        #50 in = 1;
        #200 in = 0;
        #200 in = 1;
        #200 in = 1;
        #200 in = 1;
        #200 in = 1;
        #200 in = 1;
        #200 in = 0;
        #200 $stop;
    end
endmodule