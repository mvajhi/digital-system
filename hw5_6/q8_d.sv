module q8_d (input [7:0] a,b, output lt,gt,eq);
    wire [4:0] l,g,e;
    wire [7:0] aa, bb;
    assign aa = {~a[7], a[6:0]};
    assign bb = {~b[7], b[6:0]};
    genvar i;
    generate
        for (i = 3; i >= 0; i = i - 1) begin
            q8_c cmp (.a(aa[2*i+1:2*i]), .b(bb[2*i+1:2*i]), .lt(l[i + 1]), .gt(g[i+1])
                        .eq(e[i+1]), .l(l[i]), .g(g[i]), .e(e[i]));
        end
    endgenerate

    assign {l[0],e[0],g[0]} = 3'b010;
    assign {lt,eq,gt} = {l[4],e[4],g[4]};
endmodule