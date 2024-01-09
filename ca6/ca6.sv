module ca6 (
    input start,
    input clk,
    input [15:0] x,
    input [7:0] in_y,
    output [15:0] out_ans,
    output done
);
    wire s1_rom, s1_x,
         s2_tmp, s2_x,
         s4_in, s4_mult,
         ld_tmp, init_tmp,
         ld_ans, init_ans,
         ld_x,
         sub,
         ld_y,
         less_cmp;
    wire[2:0] s3;
    wire[15:0] out_tmp;

    data_path dp (clk, x,
                  s1_rom, s1_x,
                  s2_tmp, s2_x,
                  s3,
                  s4_in, s4_mult,
                  ld_tmp, init_tmp,
                  ld_ans, init_ans,
                  ld_x,
                  sub,
                  ld_y,
                  in_y,
                  out_ans,
                  out_tmp,
                  less_cmp
    );

    state s (start,
             out_tmp,
             less_cmp,
             clk,
             s1_rom, s1_x,
             s2_tmp, s2_x,
             s3,
             s4_in, s4_mult,
             ld_tmp, init_tmp,
             ld_ans, init_ans,
             ld_x,
             sub,
             ld_y,
             done
    );
endmodule