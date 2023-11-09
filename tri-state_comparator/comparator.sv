`timescale 1ns/1ns
module tri_not(input a, en, output w);
    wire u, d;
    supply0 gnd;
    supply1 vdd;
    pmos #2 (u, vdd, a);
    pmos #2 (w, u, en);
    nmos #1 (w, d, ~en);
    nmos #1 (d, gnd, a);
endmodule

module comparator_1bit_v1 (input a, b, in, output w);
    wire i, j, k;
    xor #10 g1(i, a, b);
    nand #5 g2(j, i, b);
    nand #5 g3(w, j, k);
    tri_not g4 (.a(in), .en(i), .w(k));
endmodule

module comparator_1bit_v2 (input a, b, in, output w);
    wire i, j, ib, inb;
    xor #10 g1(i, a, b);
    nand #5 g2(j, i, b);
    not #2 g3 (ib, i);
    not #2 g4 (inb, in);
    tri_not g5 (.a(j), .en(ib), .w(w));
    tri_not g6 (.a(inb), .en(i), .w(w));
endmodule

module comparator_3bit (input [2:0] a, input [2:0] b, input in, output w);
    wire [0:1] out;
    comparator_1bit_v2 comp1 (.a(a[2]), .b(b[2]), .in(out[1]), .w(w));
    comparator_1bit_v2 comp2 (.a(a[1]), .b(b[1]), .in(out[0]), .w(out[1]));
    comparator_1bit_v2 comp3 (.a(a[0]), .b(b[0]), .in(in), .w(out[0]));
endmodule