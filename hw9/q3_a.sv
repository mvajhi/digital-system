module q3_a (input t, clk, en, output logic w);
    always @(posedge clk) begin
        if (en == 0 && t) w <= ~w;
    end
endmodule