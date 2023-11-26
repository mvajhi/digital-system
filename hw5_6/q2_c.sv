module q2_c #(parameter count = 4) (input [count-1:0] a, b, input ci, output [count-1:0] w, output co);
    wire [count:0] carry;
    genvar i;
    generate
        for (i = 0; i < count; i = i + 1) begin
            q2_a full_adder (.a(a[i]), .b(b[i]), .ci(carry[i]), .co(carry[i + 1]), .sum(w[i]));
        end
    endgenerate
    assign carry[0] = ci;
    assign co = carry[count];
endmodule