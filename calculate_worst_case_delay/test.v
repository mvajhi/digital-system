`timescale 1ns/1ns
module test (output y0, y1, input a,b,c);
    wire i, j, k;

    //y0
    xor #(26,22) xor1 (y0, a, b, c);

    //y1
    nand #(10, 8) a1 (i, a, b);
    nand #(10, 8) a2 (j, a, c);
    nand #(10, 8) a3 (k, b, c);
    nand #(15,12) o1 (y1, i, j, k);
endmodule