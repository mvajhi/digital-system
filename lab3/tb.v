module tb;
    reg clk = 0;
    reg reset;
    reg freq_load;
    reg [1:0] shift_amount = 2'b00;
    reg [2:0] func;
    reg [4:0] freq_in;
    wire [7:0] out;
    wire pwm_out;

    TopModule top_module (
        .clk(clk),
        .reset(reset),
        .freq_load(freq_load),
        .freq_in(freq_in),
        .func(func),
        .shift_amount(shift_amount),
        .out(out)
    );

    PWM pwm (
        .clk(clk),
        .rst(reset),
        .in(out),
        .out(pwm_out)
    );

    always #1 clk = ~clk;

    initial begin
        reset = 1;
        freq_load = 1;
        freq_in = 5'd0;
        func = 4;
        #10 reset = 0;
        freq_load = 0;

        #1000000 func = 1;
        #1000000 freq_in = 5'd3;
        // #1000000 freq_in = 5'd100;

        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 0;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;
        
        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 1;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;
        
        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 2;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;
        
        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 3;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;

        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 4;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;

        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 5;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;

        #10 reset = 1;
        #10 reset = 0;
        #100000 func = 6;
         shift_amount = 2'b00;
        #100000 shift_amount = 2'b01;
        #100000 shift_amount = 2'b10;
        
        #10 reset = 1;
        #10 reset = 0;
        #1000000 func = 3;
        #10 reset = 1;
        #10 reset = 0;
        #1000000 $finish;
    end

endmodule