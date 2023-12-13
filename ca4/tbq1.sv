module tbq1 ();
    logic S,R;
    wire Q_2, QB_2;
    wire Q_3, QB_3;
    q1_2in rs_latch_2in(S, R, Q_2, QB_2);
    q1_3in rs_latch_3in(S, R, Q_3, QB_3);

    initial begin
            S = 0; R = 1;
            #100 S = 0; R = 0;
            #100 S = 0; R = 1;
            #100 S = 0; R = 0;
            #100 S = 1; R = 0;
            #100 S = 0; R = 0;
            #100 S = 1; R = 1;
            #100 S = 0; R = 0;
            #100 S = 0; R = 1;
            #100 S = 1; R = 0;
            #100 S = 0; R = 1;
            #100 S = 1; R = 1;
            #100 S = 0; R = 1;
            #100 S = 1; R = 0;
            #100 S = 1; R = 1;
            #100 S = 1; R = 0;
            #100 S = 1; R = 1;
            #100 $stop;
    end

endmodule