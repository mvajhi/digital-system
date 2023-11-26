/*
   Number of wires:                 32
   Number of cells:                 24
     $_NOT_                          8
     $_AND_                          8
     $_XOR_                          8
*/
module q1_b_1_half_adder(input a, carry_in, output carry_out, out);
    assign out = a ^ carry_in;
    assign carry_out = a & carry_in;
endmodule

module q1_b_1_complement #(parameter count = 8) (input [count-1:0] a, output [count-1:0] w);
    wire [count:0] carry;
    wire [count:0] abar;
    genvar i;
    generate
        for (i = 0; i < count; i = i + 1) begin
            half_adder test (.a(~a[i]), .carry_in(carry[i]), .carry_out(carry[i + 1]), .out(w[i]));
        end
    endgenerate
    assign carry[0] = 1'b1;
endmodule