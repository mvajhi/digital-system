`timescale 1ns/1ns
module tb_qb();
    logic si, en = 1, clk = 0, rst = 1;
    wire [7:0] out[1:0];
    wire [1:0] co;
    wire diff_co;
    wire [7:0]diff;
    
    qb test(rst, en, si, clk, out[0], co[0]);
    pre_qb pre_test(rst, en, si, clk, out[1], co[1]);

    assign diff_co = ^co;
    assign diff = out[0] ^ out[1];

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