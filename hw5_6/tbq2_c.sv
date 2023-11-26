`timescale 1ns/1ns

module tbq2_c();
    logic [3:0] a, b;
    logic ci;
    wire [3:0] w;
    wire co;

    q2_c full (.w(w), .co(co), .a(a), .b(b), .ci(ci));

    initial {a,b,ci} = $random;
    initial repeat (20) #1000 {a,b,ci} = $random;
endmodule