module q2 (input D, CLK, output Q, Qb);
    wire G1_out, G2_out, G3_out, G4_out;
    q1_2in G1_and_G2(G4_out, CLK, G1_out, G2_out);
    q1_3in G3_and_G4(.S(CLK), .R(D), .in_s(G2_out), .in_r(D),
                        .Q(G3_out), .Qb(G4_out));
    q1_2in G5_and_G6(G2_out, G3_out, Q, Qb);
endmodule