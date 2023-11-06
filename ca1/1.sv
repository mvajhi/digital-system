module q1 (output y0, y1, input a,b,c);
    supply0 gnd;
    supply1 vdd;

    wire d1,d2,d3,d4,d5,d6,
         u1,u2,u3;

    //for y0
    pmos #(3,4,5) p1 (u2, vdd, a);
    pmos #(3,4,5) p2 (u1, vdd, b) ;
    pmos #(3,4,5) p3 (u1, vdd, ~c);
    pmos #(3,4,5) p4 (u2, u1, ~b) ;
    pmos #(3,4,5) p5 (u2, u1, c);
    pmos #(3,4,5) p6 (y0, u2, ~a);
    pmos #(3,4,5) p7 (u3, u2, c);
    pmos #(3,4,5) p8 (u3, u2, b);
    pmos #(3,4,5) p9 (y0, u3, ~c);
    pmos #(3,4,5) p10(y0, u3, ~b);

    nmos #(5,6,7) n1 (d1, gnd, a);
    nmos #(5,6,7) n2 (d2, gnd, ~a);
    nmos #(5,6,7) n3 (d3, d1, ~c);
    nmos #(5,6,7) n4 (d4, d2, c);
    nmos #(5,6,7) n5 (d5, d1, c);
    nmos #(5,6,7) n6 (d6, d2, ~c);
    nmos #(5,6,7) n7 (y0, d3, b);
    nmos #(5,6,7) n8 (y0, d4, b);
    nmos #(5,6,7) n9 (y0, d5, ~b);
    nmos #(5,6,7) n10(y0, d6, ~b);
    
endmodule
