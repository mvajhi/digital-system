`timescale 1ns/1ns
module tbq5();
    logic [0:6] inp = 7'b0;
    wire [0:2] out;
    q5 q5gate(.y(out), .in(inp));
    initial begin
        // logic table
        repeat (128) #100 inp = inp + 1;

        #100 inp = 7'bz;
        #100 inp = 7'b0000001;
        #100 inp = 7'b1110001;
        #100 inp = 7'b1110010;

        #100 $stop;
    end
endmodule
