module q1_b_2_one_bit_comp(input a, flag_in, output flag_out, out);
    assign out = (flag_in == 1'b0) ? a : ~a;
    assign flag_out = a | flag_in;
endmodule

module q1_b_2_complement #(parameter count = 8) (input [count-1:0] a, output [count-1:0] w);
    wire [count:0] carry;
    genvar i;
    generate
        for (i = 0; i < count; i = i + 1) begin
            q1_b_2_one_bit_comp bitcomp (.a(a[i]), .flag_in(carry[i]), .flag_out(carry[i + 1]), .out(w[i]));
        end
    endgenerate
    assign carry[0] = 1'b0;
endmodule