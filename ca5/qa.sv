module qa(input in, rst, clk, output find);
    logic [2:0] ns,ps;
    parameter [2:0] A = 2'b000,
                    B = 2'b001,
                    C = 2'b010,
                    D = 2'b011,
                    E = 2'b100,
                    F = 2'b101,
                    G = 2'b110,
                    H = 2'b111;
    
    always @(ps,in) begin
        ns = A;
        case (ps)
            A: ns = w ? A : B;
            B: ns = w ? C : B;
            C: ns = w ? D : B;
            D: ns = w ? E : B;
            E: ns = w ? F : B;
            F: ns = w ? G : B;
            G: ns = w ? A : H;
            H: ns = w ? C : B;
            default: ns = A;
        endcase
    end

    assign find = (ps == H) ? 1'b1 : 1'b0;

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= A;
        else
            ps <= ns;
    end
endmodule