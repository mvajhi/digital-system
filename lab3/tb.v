module tb;
    reg clk = 0;
    reg reset;
    reg freq_load;
    reg [2:0] func;
    reg [4:0] freq_in;
    wire [7:0] out;

    TopModule top_module (
        .clk(clk),
        .reset(reset),
        .freq_load(freq_load),
        .freq_in(freq_in),
        .func(func),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        reset = 1;
        freq_load = 1;
        freq_in = 5'b11111;
        func = 0;
        #10 reset = 0;

        #10000 func = 1;

        #10000 func = 2;

        #10000 func = 3;

        #10000 $finish;
    end

endmodule