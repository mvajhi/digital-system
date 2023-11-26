`timescale 1ns/1ns

module tbq1();
    reg [7:0] a;
    wire [7:0] w1,w2;

    q1_b_1_complement q1_b_1 (.w(w1), .a(a));
    q1_b_2_complement q1_b_2 (.w(w2), .a(a));

    initial a = $random;
    initial repeat (20) #1000 a = $random;
endmodule