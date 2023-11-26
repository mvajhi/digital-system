`timescale 1ns/1ns

module q6_c (input a,b,c,d,e , output w);
    wire [15:0] in;
    wire [3:0] s;
    assign s = {a,b,c,d};
    assign in = {
        e,
        1'b1,
        e,
        ~e,
        1'b1,
        1'b0,
        1'b0,
        1'b1,
        e,
        ~e,
        e,
        ~e,
        ~e,
        e,
        ~e,
        1
    };
    q6_b mux_16 (.in(in), .select(s), .w(w));
endmodule