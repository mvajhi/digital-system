`timescale 1ns/1ns
module q7 (output [0:3] y, input [0:14] in);
    wire [2:0] out_a, out_b, out_c;
    wire [1:0] out_d;
    q6 oca (.in(in[0:6]), .y(out_a));
    q6 ocb (.in(in[7:13]), .y(out_b));
    q6 occ (.in({in[14], out_a[0], out_a[1], out_a[1], out_b[0], out_b[1], out_b[1]}), .y(out_c));
    q4 ocd (.a(out_a[2]), .b(out_b[2]), .c(out_c[2]), .y0(out_d[0]), .y1(out_d[1]));
    assign y = {out_d[1], out_d[0], out_c[1], out_c[0]};
endmodule