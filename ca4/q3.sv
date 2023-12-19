module q3 (input D, CLK, CLR_b, PRE_b, output Q, Qb);
    wire G1_out, G2_out, G3_out, G4_out;
    q1_3in G1_and_G2(.S(G4_out), .R(CLK), .in_s(PRE_b), .in_r(CLR_b),
                        .Q(G1_out), .Qb(G2_out));

    q1_3in G3_and_G4(.S(CLK), .R(D), .in_s(G2_out), .in_r(CLR_b),
                        .Q(G3_out), .Qb(G4_out));

    q1_3in G5_and_G6(.S(G2_out), .R(G3_out), .in_s(PRE_b), .in_r(CLR_b),
                        .Q(Q), .Qb(Qb));
endmodule