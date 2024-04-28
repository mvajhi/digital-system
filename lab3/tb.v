module Waveform_Generator_tb;
    reg clk = 0;
    reg reset;
    reg [2:0] func;
    wire [7:0] out;

    Waveform_Generator dut (
        .clk(clk),
        .reset(reset),
        .func(func),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        reset = 1;
        func = 0;
        #10 reset = 0;

        #10000 reset = 1;
        func = 1;
        #10 reset = 0;

        #10000 reset = 1;
        func = 2;
        #10 reset = 0;

        #10000 reset = 1;
        func = 3;
        #10 reset = 0;
        #10000 $finish;
    end

endmodule