module q2 #(parameter count = 8) (input CLK, rest, s, in , input [count - 1 : 0] load, output logic [count - 1 : 0] w, output logic out);
    always @(posedge CLK, posedge rest) begin
        if (rest) w <= count'b0;
        else if (s) {w, out} <= {in, w};
        else w <= load;
    end
endmodule