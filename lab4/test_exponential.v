module tb_exponential;
  
  reg clk, rst, start;
  reg [15:0] x;
  wire done;
  wire [1:0] intpart;
  wire [15:0] fracpart;
  
  exponential dut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .x(x),
    .done(done),
    .intpart(intpart),
    .fracpart(fracpart)
  );
  
  initial begin
    clk = 0;
    rst = 1;
    start = 0;
    x = 16'b1000_0000_0000_0000;
    
    #10 rst = 0;
    #10 start = 1;
    #10 x = 16'b0100_0000_0000_0000;
    
    #10 rst = 0;
    #10 start = 1;
    #10 x = 16'b1100_0000_0000_0000;
  
    
    #100 $finish;
  end
  
  always #5 clk = ~clk;
  
endmodule