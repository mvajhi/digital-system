`timescale 1ns/1ns
module tb_qc();
    logic ld = 1, clk = 0;
    logic [7:0] pi = 5;
    wire co;
    
    qc test(clk, ld, pi, co);

    always #100 clk = ~clk;
    initial begin
        #10 ld = 0;
        repeat (10) #200 ld = 0;
        #200 $stop;
    end
endmodule