`timescale 1ns/1ns
module tbq6();
    logic [0:6] inp = 7'b0;
    wire [0:2] q5out;
    wire [0:2] q6out;
    q5 q5gate(.y(q5out), .in(inp));
    q6 q6gate(.y(q6out), .in(inp));
    initial begin
        // logic table
        repeat (128) #1000 inp = inp + 1;

        #1000 inp = 7'bz;
        #1000 inp = 7'b0000001;
        #1000 inp = 7'b1110001;
        #1000 inp = 7'b1110010;

        #1000 $stop;
    end
endmodule
