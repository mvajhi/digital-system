`timescale 1ns/1ns

module tbq2();
    reg [15:0] a,b;
    reg cin;
    reg [2:0] opc = 3'b0;
    wire [15:0] w, wsy;
    wire zer, zersy, neg, negsy;

    q2 my_ALU (.w(w), .zer(zer), .neg(neg), .opc(opc), .ina(a), .inb(b), .inc(cin));

    initial {a, b, cin} = $random;
    initial repeat (20) #1000 {a, b, cin} = $random;
    initial repeat (20) #1000 opc = opc + 3'b001;
endmodule