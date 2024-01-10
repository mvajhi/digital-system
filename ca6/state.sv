module state (
    input start,
    input[15:0] out_tmp,
    input less_cmp,
    input clk,
    output s1_rom, s1_x,
    output s2_tmp, s2_x,
    output logic [2:0] s3,
    output s4_in, s4_mult,
    output ld_tmp, init_tmp,
    output ld_ans, init_ans,
    output ld_x,
    output sub,
    output ld_y,
    output done
);
    parameter [2:0] s_idle = 3'b000,
                    s_intial = 3'b001,
                    s_cal_x = 3'b010,
                    s_mult_1 = 3'b011,
                    s_mult_2 = 3'b100,
                    s_add = 3'b101;
    logic end_flag;
    logic [2:0] ps, ns;

    // transfer part
    always @(ps, start, end_flag) begin
        case(ps)
        s_idle:     ns = start ? s_intial : s_idle;
        s_intial:   ns = start ? s_intial : s_cal_x;
        s_cal_x:    ns = s_mult_1;
        s_mult_1:   ns = s_mult_2;
        s_mult_2:   ns = s_add;
        s_add:      ns = end_flag ? s_idle : s_mult_1;
        default:    ns = s_idle;
        endcase
    end

    always @(posedge clk) begin
        ps <= ns;
    end

    // out signals
    assign s1_rom = (ps == s_mult_1) ? 1'b1 : 1'b0;
    assign s1_x = (ps == s_cal_x || ps == s_mult_2) ? 1'b1 : 1'b0;
    assign s2_tmp = (ps == s_mult_1 || ps == s_mult_2) ? 1'b1 : 1'b0;
    assign s2_x = (ps == s_cal_x) ? 1'b1 : 1'b0;
    assign s4_in = (ps == s_intial) ? 1'b1 : 1'b0;
    assign s4_mult = (ps == s_cal_x) ? 1'b1 : 1'b0;
    assign ld_tmp = (ps == s_mult_1 || ps == s_mult_2) ? 1'b1 : 1'b0;
    assign init_tmp = (ps == s_cal_x) ? 1'b1 : 1'b0;
    assign init_ans = (ps == s_cal_x) ? 1'b1 : 1'b0;
    assign ld_ans = (ps == s_add) ? 1'b1 : 1'b0;
    assign ld_x = (ps == s_intial || ps == s_cal_x) ? 1'b1 : 1'b0;
    assign sub = s3[0];
    assign ld_y = (ps == s_intial) ? 1'b1 : 1'b0;
    assign done = end_flag;

    // other parts
	 wire [2:0] ns3;
	 assign ns3 = s3 + 1'b1;
    assign end_flag = (s3 == 3'b111 || less_cmp == 1'b1) ? 1'b1 : 1'b0;
    always @(posedge clk) begin
        if (ps == s_idle)
            s3 <= 3'b0;
        else if (ps == s_add)
            s3 <= ns3;
			else
				s3 <= s3;
    end
endmodule