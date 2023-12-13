module q2 (input D, CLK, output Q, Qb);
    wire G1_out, G2_out, G3_out, G4_out;
    nand #8 G1(G1_out, G4_out, G2_out);
    nand #8 G2(G2_out, G1_out, CLK);
    nand #12 G3(G3_out, G4_out, G2_out, CLK);
    nand #8 G4(G4_out, G3_out, D);
    nand #8 G5(Q, G2_out, Qb);
    nand #8 G6(Qb, G3_out, Q);
endmodule