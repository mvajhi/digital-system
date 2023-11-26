`timescale 1ns/1ns

module decoder_2_4 (input [1:0] in, output[3:0] w);
    assign w = 
        (a == 3'b000) ? 4'b0001:
        (a == 3'b001) ? 4'b0010:
        (a == 3'b010) ? 4'b0100:
        (a == 3'b011) ? 4'b1000:
        8'bx;
endmodule

module q6_b (input [15:0] in, input [3:0] select, output w);
    wire [3:0] en;

    decoder_2_4 dec (.in(select[3:2]), en);
    
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin
            q6_a_high mux(.select(select[1:0]), .en(en[i]), 
                            .in(in[4 * (i + 1): 4 * i]), .w(w));
        end
    endgenerate
endmodule