`timescale 1ns/1ns
module tb();
    logic aa,bb;
    wire out;
    comparator_1bit_v2 my_comp (.a(aa), .b(bb), .in(1'b0), .w(out));

    initial begin
        #100 aa = 0; bb = 0;
        #100 aa = 0; bb = 1;
        #100 aa = 0; bb = 0;
        #100 aa = 1; bb = 0;
        #100 aa = 0; bb = 0;
        #100 aa = 1; bb = 1;
        #100 aa = 0; bb = 0;
        #100 aa = 0; bb = 1;
        #100 aa = 1; bb = 0;
        #100 aa = 0; bb = 1;
        #100 aa = 1; bb = 1;
        #100 aa = 0; bb = 1;
        #100 aa = 1; bb = 0;
        #100 aa = 1; bb = 1;
        #100 aa = 1; bb = 0;
        #100 aa = 1; bb = 1;
        #100 $stop;
    end
endmodule