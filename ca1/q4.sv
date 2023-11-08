`timescale 1ns/1ns
module q4 (output y0, y1, input a,b,c);
    assign #(24,29) y0 = a ^ b ^ c;
    assign #(15,14) y1 = a & b | a & c | b & c;
endmodule