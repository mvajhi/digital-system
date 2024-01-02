module pre_qb(input rst, en, si, clk, output logic [7:0] out, output co);
    // counter
    logic [2:0] counter;
    always@(posedge clk, posedge rst) begin
        if (rst)
            counter <= 3'b0;
        else
            if (en)
                counter <= counter + 1;
    end

    assign co = &counter;

    // shift reg
    always@(posedge clk) begin
        if (en)
            out <= {si, out[7:1]};
    end
endmodule
