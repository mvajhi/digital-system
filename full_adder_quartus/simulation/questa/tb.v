`timescale 1ns/1ns
module tb();
    reg a, b, cin;
    wire si, co;
    test UUT (.a(a), .b(b), .cin(cin), .si(si), .co(co));
    initial repeat (20) #100 {a,b,cin} = $random;
endmodule