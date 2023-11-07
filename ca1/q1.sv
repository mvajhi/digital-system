`timescale 1ns/1ns
module q1 (output y0, y1, input a,b,c);
    supply0 gnd;
    supply1 vdd;

    wire d1,d2,d3,d4,d5,
         u1,u2,u3,u4,u5;

    //for y1
    pmos #(5,6,7) p1 (u1, vdd, ~a);
    pmos #(5,6,7) p2 (u2, vdd, ~b);
    pmos #(5,6,7) p3 (y1, u1, ~b);
    pmos #(5,6,7) p4 (y1, u1, ~c);
    pmos #(5,6,7) p5 (y1, u2, ~c);

    nmos #(3,4,5) n1 (y1, d1, ~b);
    nmos #(3,4,5) n2 (y1, d1, ~c);
    nmos #(3,4,5) n3 (d1, gnd, ~a);
    nmos #(3,4,5) n4 (d1, d2, ~b);
    nmos #(3,4,5) n5 (d2, gnd, ~c);

    //for y0
    pmos #(5,6,7) p6 (u3, vdd, ~a);
    pmos #(5,6,7) p7 (u4, vdd, y1);
    pmos #(5,6,7) p8 (u5, u3, ~b);
    pmos #(5,6,7) p9 (y0, u5, ~c);
    pmos #(5,6,7) p10(y0, u4, ~a);
    pmos #(5,6,7) p11(y0, u4, ~b);
    pmos #(5,6,7) p12(y0, u4, ~c);

    nmos #(3,4,5) n6 (y0, d3, ~a);
    nmos #(3,4,5) n7 (y0, d3, ~b);
    nmos #(3,4,5) n8 (y0, d3, ~c);
    nmos #(3,4,5) n9 (d3, gnd, y1);
    nmos #(3,4,5) n10(d3, d4, ~a);
    nmos #(3,4,5) n11(d4, d5, ~b);
    nmos #(3,4,5) n12(d5, gnd, ~c);
    
endmodule
