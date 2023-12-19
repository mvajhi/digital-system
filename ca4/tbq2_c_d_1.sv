module tbq2_c_d_1();
    logic d = 0, clk = 0;
    wire Q, Qb;
    q2 d_flip_flop (d, clk, Q, Qb);
    initial forever #100 clk = ~clk;
    initial begin
        #280 d = 1; // 280  20ns before clk
        #140 d = 0; // 420  
        #268 d = 1; // 688  12ns before clk
        #152 d = 0; // 840  
        #280 d = 1; // 1120 20ns after clk
        #140 d = 0; // 1260  
        #241 d = 1; // 1801 1ns after clk
        #400 $stop;
    end
endmodule
