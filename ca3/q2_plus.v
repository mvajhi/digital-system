`timescale 1ns/1ns

module q2_plus (output reg [15:0] w, output reg zer,neg,
            input [2:0] opc, input signed [15:0] ina, inb, input inc);
    wire [15:0] adder_out, not_a, shift_b, mux_adder_a, mux_adder_b, mux_adder_c;
    assign not_a = ~ina;
    assign shift_b = inb >>> 1;

    assign mux_adder_c = 
        (opc[1:0] == 2'b00) ? 1'b1:
        (opc[1:0] == 2'b01) ? 1'b1:
        (opc[1:0] == 2'b10) ? inc:
        (opc[1:0] == 2'b11) ? 1'b0:
        1'bx;

    assign mux_adder_b = 
        (opc[1:0] == 2'b00) ? 16'b0:
        (opc[1:0] == 2'b01) ? 16'b0:
        (opc[1:0] == 2'b10) ? inb:
        (opc[1:0] == 2'b11) ? shift_b:
        16'bx;

    assign mux_adder_a = 
        (opc[1:0] == 2'b00) ? not_a:
        (opc[1:0] == 2'b01) ? ina:
        (opc[1:0] == 2'b10) ? ina:
        (opc[1:0] == 2'b11) ? ina:
        16'bx;

    assign adder_out = mux_adder_a + mux_adder_b + mux_adder_c;

    wire [15:0] mixed_a_b, or_a_b, and_a_b, mux_4_5_6;
    assign and_a_b = ina & inb;
    assign or_a_b = ina | inb;
    assign mixed_a_b = {ina[7:0], inb[7:0]};

    assign mux_4_5_6 = 
        (opc[1:0] == 2'b00) ? and_a_b:
        (opc[1:0] == 2'b01) ? or_a_b:
        (opc[1:0] == 2'b10) ? mixed_a_b:
        1'b0;

    assign w = 
        (opc[2] == 1'b0) ? adder_out:
        (opc[2] == 1'b1) ? mux_4_5_6:
        1'b0;
    
    assign zer = ~|w;
    assign neg = w[15];
endmodule