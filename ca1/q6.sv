`timescale 1ns/1ns
module q6 (output [2:0] y, input [0:6] in);
    wire i,j,k,l,m;
    q4 oc1 (.a(in[0]), .b(in[1]), .c(in[2]), .y0(j), .y1(i));
    q4 oc2 (.a(in[3]), .b(in[4]), .c(in[5]), .y0(k), .y1(l));
    q4 oc3 (.a(in[6]), .b(j), .c(k), .y0(y[0]), .y1(m));
    q4 oc4 (.a(i), .b(l), .c(m), .y0(y[1]), .y1(y[2]));
endmodule