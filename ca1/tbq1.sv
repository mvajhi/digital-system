`timescale 1ns/1ns
module tbq1();
    logic aa,bb,cc;
    wire out0,out1;
    q1 mygate(.y0(out0), .y1(out1), .a(aa), .b(bb), .c(cc));
    initial begin
        // logic table
        #100 aa=0;bb=0;cc=0;
        #100 aa=0;bb=0;cc=1;
        #100 aa=0;bb=1;cc=0;
        #100 aa=0;bb=1;cc=1;
        #100 aa=1;bb=0;cc=0;
        #100 aa=1;bb=0;cc=1;
        #100 aa=1;bb=1;cc=0;
        #100 aa=1;bb=1;cc=1;

        #100 {aa,bb,cc}=3'bzzz;

        //0 for y1
        #100 aa=0;bb=0;cc=0;
        #100 aa=0;bb=0;cc=1;
        #100 aa=0;bb=1;cc=0;
        #100 aa=1;bb=0;cc=0;

        #100 {aa,bb,cc}=3'bzzz;

        //1 for y1
        #100 aa=0;bb=1;cc=1;
        #100 aa=1;bb=1;cc=0;
        #100 aa=1;bb=0;cc=1;
        #100 aa=1;bb=1;cc=1;

        #100 {aa,bb,cc}=3'bzzz;

        //0 for y0
        #100 aa=0;bb=0;cc=0;
        #100 aa=0;bb=1;cc=1;
        #100 aa=1;bb=0;cc=1;
        #100 aa=1;bb=1;cc=0;

        #100 {aa,bb,cc}=3'bzzz;

        //1 for y0
        #100 aa=0;bb=0;cc=1;
        #100 aa=0;bb=1;cc=0;
        #100 aa=1;bb=0;cc=0;
        #100 aa=1;bb=1;cc=1;

        #100 {aa,bb,cc}=3'bzzz;

        // all transfers
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 0; bb = 0; cc = 0;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 0; bb = 0; cc = 1;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 0; bb = 1; cc = 0;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 0; bb = 1; cc = 1;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 1; bb = 0; cc = 0;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 1; bb = 0; cc = 1;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 1; bb = 1; cc = 1;
        #100 aa = 1; bb = 1; cc = 0;
        #100 aa = 1; bb = 1; cc = 1;

        #100 $stop;
    end
endmodule
