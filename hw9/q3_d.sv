module q3_d (input en, clk, cin, output [7:0] w, output cout);
    wire [8:0] t;
    genvar i;
    generate
        for (i = 0; i < 8; i += 1) begin
            q3_c slice (t[i], clk, en, w[i], t[i+1]);
        end
    endgenerate
    assign t[0] = cin;
    assign cout = t[8];
endmodule