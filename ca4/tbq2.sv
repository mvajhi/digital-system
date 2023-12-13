module tbq2();
    logic d = 0, clk = 0;
    wire Q, Qb;
    q2 d_flip_flop (d, clk, Q, Qb);
    initial repeat (15) #100 clk = ~clk;
    initial repeat (15) #150 d = $random;
endmodule