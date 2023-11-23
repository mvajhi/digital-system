`timescale 1ns/1ns
module q1 (output reg [15:0] w, output reg zer,neg,
            input [2:0] opc, input [15:0] ina, inb, input inc);
    always @(opc,ina,inb,inc) begin
        w = 16'b0;
        zer = 1'b0;
        neg = 1'b0;
        
        case(opc)
            3'b000: w = ~ina + 1;
            3'b001: w = ina + 1;
            3'b010: w = ina + inb + inc;
            3'b011: w = ina + ($signed(inb) >> 1);
            3'b100: w = ina & inb;
            3'b101: w = ina | inb;
            3'b110: w = {ina[7:0], inb[7:0]};
        endcase

        neg = w[15];
        
        if (w == 16'b0)
            zer = 1'b1;
        else
            zer = 1'b0;
    end
endmodule