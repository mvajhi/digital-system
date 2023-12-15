module q3_c (input t, clk, en, output logic w, out);
    q3_a (t, clk, en, w);
    assign out = t & w;
endmodule