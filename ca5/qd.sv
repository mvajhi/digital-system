module qd (input clk, find_FSS, co_G8FN, co_SNIO,
           output logic seroutvalid, rst_FSS, rst_G8FN, en_G8FN, ld_SNIO);
    parameter S_FSS  = 2'b00,
              S_G8FN = 2'b01,
              S_SNIO = 2'b10;
    logic[1:0] ps, ns;

    always @(find_FSS, co_G8FN, co_SNIO) begin
        ns = ps;
        case (ps)
            S_FSS:  ns = find_FSS ? S_G8FN : S_FSS;
            S_G8FN: ns = co_G8FN  ? S_SNIO : S_G8FN;
            S_SNIO: ns = co_SNIO  ? S_FSS  : S_SNIO;
            default: ns = S_FSS;
        endcase

        if (ps)
            rst_G8FN = 1'b1;
        else
            rst_G8FN = 1'b0;


        if (ns == S_G8FN  || ps == S_G8FN)
            en_G8FN = 1'b1;
        else
            en_G8FN = 1'b0;


        if (ps == S_SNIO && co_SNIO == 1'b1)
            seroutvalid = 1'b1;
        else if (ps == S_G8FN && co_G8FN == 1'b1)
            seroutvalid = 1'b1;
        else
            seroutvalid = 1'b0;


        if (ps == S_G8FN && ns == S_SNIO)
            ld_SNIO = 1'b1;
        else
            ld_SNIO = 1'b0;


        if (ps == S_SNIO && co_SNIO == 1'b1)
            rst_FSS = 1'b1;
        else
            rst_FSS = 1'b0;
    end

    always @(posedge clk) begin
        ps <= ns;
    end
endmodule