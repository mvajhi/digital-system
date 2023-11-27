module q7_c (input a,b,l,g,e, output lt,gt,eq);
    assign #17 lt = ~a & b | ~a & l |  b & l;
    assign #17 gt = a & ~b | a & g  | ~b & g;
    assign #17 eq = ~a & ~b & e | a & b & e;
endmodule