module q7_d (input [7:0] a,b, output lt,gt,eq);
    wire [8:0] l,g,e;
    assign aa = {~a[7], a[6:0]};
    assign bb = {~b[7], b[6:0]};
    genvar i;
    generate
        for (i = 7; i >= 0; i = i - 1) begin
            q7_c cmp (.a(aa[i]), .b(bb[i]), .lt(l[i + 1]), .gt(g[i+1])
                        .eq(e[i+1]), .l(l[i]), .g(g[i]), .e(e[i]));
        end
    endgenerate

    assign {l[0],e[0],g[0]} = 3'b010;
    assign {lt,eq,gt} = {l[8],e[8],g[8]};
endmodule