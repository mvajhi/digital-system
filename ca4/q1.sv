module q1_2in (input S, R, output Q, Qb);
    nand #8 N1 (Q, Qb, S);
    nand #8 N2 (Qb, Q, R);
endmodule

module q1_3in (input S, R, in_s, in_r, output Q, Qb);
    nand #12 N1 (Q, S, in_s, Qb);
    nand #12 N2 (Qb, R, in_r, Q);
endmodule