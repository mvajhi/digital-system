module tb;
    reg clk = 0;
    reg reset;
    reg freq_load;
    reg [1:0] shift_amount = 2'b00;
    reg [2:0] func;
    reg [4:0] freq_in;
    wire [7:0] out;

    TopModule top_module (
        .clk(clk),
        .reset(reset),
        .freq_load(freq_load),
        .freq_in(freq_in),
        .func(func),
        .shift_amount(shift_amount),
        .out(out)
    );

    always #1 clk = ~clk;

    initial begin
        reset = 1;
        freq_load = 1;
        freq_in = 5'b0;
        func = 4;
        #10 reset = 0;
        freq_load = 0;

        #1000000 func = 5;
        #1000000 shift_amount = 2'b01;
        #10 reset = 1;
        #10 reset = 0;
        #1000000 func = 6;
        #1000000 shift_amount = 2'b10;
        #10 reset = 1;
        #10 reset = 0;
        #1000000 func = 3;
        #10 reset = 1;
        #10 reset = 0;
        #1000000 $finish;
    end

endmodule