`timescale 1ns/1ns
module tb_qb();
    logic si, en = 1, clk = 0, rst = 1;
    wire [7:0] out;
    wire co;
    
    qb test(rst, en, si, clk, out, co);

    always #100 clk = ~clk;
    initial begin
        #1 rst = 0;
        #50  si = 1;
        #200 si = 0;
        #200 si = 1;
        #200 si = 1;
        #200 si = 0;
        #200 si = 1;
        #200 si = 1;
        #200 si = 0;
        #200 en = 0;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 si = 1;
        #200 $stop;
    end
endmodule