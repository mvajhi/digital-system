module q3_b (input en, clk, output [7:0] w, output carry);
    wire [8:0] in_clk;
    genvar i;
    generate
        for (i = 0; i < 8; i += 1) begin
            q3_a slice (en, in_clk[i], ~en, in_clk[i + 1]);
        end
    endgenerate
    assign carry = in_clk[8];
    assign in_clk[0] = clk;
endmodule