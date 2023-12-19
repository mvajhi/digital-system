module tbq3_random();
    logic d = 0, clk = 0, pre = 1, clr = 1;
    wire Q, Qb;
    q3 d_flip_flop (d, clk, pre , clr, Q, Qb);
    initial repeat (15) #100 clk = ~clk;
    initial repeat (15) #150 d = $random;
endmodule