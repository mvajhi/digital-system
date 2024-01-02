`timescale 1ns/1ns
module tb_qd();
    logic clk = 0, serin = 0;
    wire seroutvalid, serout;
    
    ca5_qd test(seroutvalid, clk, serin, serout);


    always #500 clk = ~clk;
    initial begin
        #100 serin = 0;
        #1000 serin = 0;
        #1000 serin = 0;

        //start seq
        #1000 serin = 0;
        #1000 serin = 1;
        #1000 serin = 1;
        #1000 serin = 1;
        #1000 serin = 1;
        #1000 serin = 1;
        #1000 serin = 0;

        // set nt
        #1000 serin = 1;
        #1000 serin = 0;
        #1000 serin = 1;
        #1000 serin = 0;

        #1000 serin = 0;
        #1000 serin = 0;
        #1000 serin = 0;
        #1000 serin = 0;

        //out value
        #1000 serin = 1;
        #1000 serin = 0;
        #1000 serin = 1;
        #1000 serin = 0;
        #1000 serin = 1;

        #1000 $stop;
    end
endmodule