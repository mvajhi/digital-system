`timescale 1ns/1ns
module tbq4();
    logic aa,bb,cc;
    wire q1out0,q1out1;
    wire q3out0,q3out1;
    wire q4out0,q4out1;
    q1 q1gate(.y0(q1out0), .y1(q1out1), .a(aa), .b(bb), .c(cc));
    q3 q3gate(.y0(q3out0), .y1(q3out1), .a(aa), .b(bb), .c(cc));
    q4 q4gate(.y0(q4out0), .y1(q4out1), .a(aa), .b(bb), .c(cc));
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
