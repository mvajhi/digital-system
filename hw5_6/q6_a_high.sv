`timescale 1ns/1ns

module q6_a_high (input [3:0] in, input [1:0] select, input en, output w);
    assign w = 
        (en == 1'b0) ? 1'bz:
        (select == 2'b00) ? in[0]:
        (select == 2'b01) ? in[1]:
        (select == 2'b10) ? in[2]:
        (select == 2'b11) ? in[3]:
        1'bx;
endmodule