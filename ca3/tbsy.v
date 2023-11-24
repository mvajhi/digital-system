`timescale 1ns/1ns

module tbsy();
    reg [15:0] a,b;
    reg cin;
    reg [2:0] opc = 3'b0;
    wire [2:0][15:0] w;
    wire [2:0] zer, neg;

    syq1        q1      (.w(w[0]), .zer(zer[0]), .neg(neg[0]), .opc(opc), .ina(a), .inb(b), .inc(cin));
    syq2        q2      (.w(w[1]), .zer(zer[1]), .neg(neg[1]), .opc(opc), .ina(a), .inb(b), .inc(cin));
    syq2_plus   q2_plus (.w(w[2]), .zer(zer[2]), .neg(neg[2]), .opc(opc), .ina(a), .inb(b), .inc(cin));

    initial {a, b, cin} = $random;
    initial repeat (20) #1000 {a, b, cin} = $random;
    initial repeat (20) #1000 opc = opc + 3'b001;
endmodule