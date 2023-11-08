`timescale 1ns/1ns
module q4 (output y0, y1, input a,b,c);
    assign #(26,22) y0 = a ^ b ^ c;
    assign #(23,22) y1 = a & b | a & c | b & c;
endmodule