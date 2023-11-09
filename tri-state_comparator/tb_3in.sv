`timescale 1ns/1ns
module tb_3in();
    logic [2:0] aa,bb;
    wire out;
    comparator_3bit my_comp (.a(aa), .b(bb), .in(1'b0), .w(out));

    initial begin
        for (int i = 0; i < 8; i++) begin
            for(int j = 0; j < 8; j++) begin
                #100 aa = i; bb = j;
            end
        end
        #100 $stop;
    end
endmodule