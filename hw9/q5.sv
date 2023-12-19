module q5 (input Si, clk, output logic [3:0] w = 0, output So);
    always @(posedge clk) begin
        w[2:0] <= {Si ^ w[0], w[2], w[1] ^ w[0]};
    end
    assign w[3] = Si;
    assign So = w[0];
endmodule