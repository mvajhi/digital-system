`timescale 1ns/1ns

module tbq1();
    logic [15:0] a,b;
    logic cin;
    logic [2:0] opc = 3'b0;
    wire [15:0] w;
    wire zer, neg;

    q1 my_ALU (.w(w), .zer(zer), .neg(neg), .opc(opc), .ina(a), .inb(b), .inc(cin));

    initial repeat (20) #100 {a, b, cin} = $random;
    initial repeat (20) #50 opc = opc + 3'b001;

endmodule