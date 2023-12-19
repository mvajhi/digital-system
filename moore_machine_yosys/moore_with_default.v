module moor_with_default (input clk, rst, j, output w);
    reg [2:0] ns, ps;

    always @(ps,j) begin
        ns = 3'b000;
        case(ps)
            3'b000: ns = j ? 3'b001 : 3'b000;
            3'b001: ns = j ? 3'b001 : 3'b010;
            3'b010: ns = j ? 3'b011 : 3'b000;
            3'b011: ns = j ? 3'b100 : 3'b010;
            3'b100: ns = j ? 3'b001 : 3'b010;
            default: ns = 3'b000;
        endcase
    end

    assign w = (ps == 3'b100) ? 1'b1 : 1'b0;

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= 3'b000;
        else
            ps <= ns;
    end
endmodule







