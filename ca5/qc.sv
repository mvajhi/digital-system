module qc (input logic clk, input logic ld, input logic [7:0] pi, output logic co);
  logic [7:0] out;

  always @(posedge clk, posedge ld) begin
    if (ld) begin
      out <= pi - 1;
    end else begin
      out <= out - 1;
    end
  end

  assign co = ~|out;

endmodule