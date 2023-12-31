module qa(input in, rst, clk, output find);
    logic [2:0] ns,ps;
    parameter [2:0] A = 3'b000,
                    B = 3'b001,
                    C = 3'b010,
                    D = 3'b011,
                    E = 3'b100,
                    F = 3'b101,
                    G = 3'b110,
                    H = 3'b111;
    
    always @(ps,in) begin
        ns = A;
        case (ps)
            A: ns = in ? A : B;
            B: ns = in ? C : B;
            C: ns = in ? D : B;
            D: ns = in ? E : B;
            E: ns = in ? F : B;
            F: ns = in ? G : B;
            G: ns = in ? A : H;
            H: ns = in ? C : B;
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