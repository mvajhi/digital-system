module concat (
    input [7:0] vi,
    output [23:0] result
);

    assign result = {8'b000, vi, 8'b00000000};

endmodule