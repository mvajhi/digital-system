module q8_c (input [1:0] a,b,input l,g,e, output lt,gt,eq);
    assign #27 lt = ~a[0] & b[0] | ~a[0] & ~b[1] & l | ~b[1] & b[0] & l | a[1] & ~a[0] & ~b[1] | a[1] & ~a[0] & l | a[1] & ~b[1] & b[0] | a[1] & b[0] & l;
    assign #29 gt = a[0] & ~b[0] | a[0] & b[1] & ~g | a[1] & a[0] & ~g | a[1] & a[0] & b[1] | ~a[1] & b[1] & ~b[0] & ~g | a[1] & ~b[1] & ~b[0] & ~g | a[1] & b[1] & ~b[0] & g;
    assign #25 eq = e & ~a[1] & ~a[0] & ~b[1] & ~b[0] | e & ~a[1] & a[0] & ~b[1] & b[0] | e & a[1] & ~a[0] & b[1] & ~b[0] | e & a[1] & a[0] & b[1] & b[0];
endmodule