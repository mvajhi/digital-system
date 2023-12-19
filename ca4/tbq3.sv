module tbq3();
    logic d = 0, clk = 0, pre = 1, clr = 1;
    wire Q, Qb;
    q3 d_flip_flop (d, clk, clr, pre, Q, Qb);
    initial repeat (15) #100 clk = ~clk;
    initial begin
        #150 d = 1; // 150
        #130 clr = 0; //280
        #50 d = 0; clr = 1; //330
        #70 pre = 0; //400
        #200 clr = 0; d = 1; //600
        #400 $stop;
    end
endmodule