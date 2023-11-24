`timescale 1ns/1ns

module q2 (output reg [15:0] w, output reg zer,neg,
            input [2:0] opc, input signed [15:0] ina, inb, input inc);
    wire [15:0] out [7:0];
    assign out[0] = ~ina + 1;
    assign out[1] = ina + 1;
    assign out[2] = ina + inb + inc;
    assign out[3] = ina + (inb >>> 1);
    assign out[4] = ina & inb;
    assign out[5] = ina | inb;
    assign out[6] = {ina[7:0], inb[7:0]};

    assign w = 
        (opc == 3'b000) ? out[0]:
        (opc == 3'b001) ? out[1]:
        (opc == 3'b010) ? out[2]:
        (opc == 3'b011) ? out[3]:
        (opc == 3'b100) ? out[4]:
        (opc == 3'b101) ? out[5]:
        (opc == 3'b110) ? out[6]:
        1'b0;
    
    assign zer = (w == 16'b0) ? 1 : 0;
    assign neg = w[15];
endmodule