module moor_with_default_v2 (input clk, rst, j, output w);
    reg [2:0] ns, ps;

    always @(ps,j) begin
        ns = 3'b100;
        case(ps)
            3'b100: ns = j ? 3'b101 : 3'b100;
            3'b101: ns = j ? 3'b101 : 3'b110;
            3'b110: ns = j ? 3'b111 : 3'b100;
            3'b111: ns = j ? 3'b000 : 3'b110;
            3'b000: ns = j ? 3'b101 : 3'b110;
            default: ns = 3'b100;
        endcase
    end

    assign w = (ps == 3'b000) ? 1'b1 : 1'b0;

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= 3'b100;
        else
            ps <= ns;
    end
endmodule






