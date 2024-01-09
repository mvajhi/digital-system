module data_path (
    input clk,
    input [15:0] x,
    input s1_rom, s1_x,
    input s2_tmp, s2_x,
    input [7:0] s3,
    input s4_in, s4_mult,
    input ld_tmp, init_tmp,
    input ld_ans, init_ans,
    input ld_x,
    input sub,
    input ld_y,
    input [7:0] in_y,
    output logic [15:0] out_ans,
    output logic [15:0] out_tmp,
    output logic less_cmp
);
    parameter [15:0] default_tmp = 16'b0000000100000000, 
                     default_ans = 16'b0000000100000000;
    logic[15:0] rom_out;
    logic [15:0] out_x;
    logic [7:0] out_y;
    //MULT
    wire [31:0] out_mult_32;
    wire [15:0] out_mult;
    wire [15:0] in_mult_1, in_mult_2;
    
    assign out_mult_32 = in_mult_1 * in_mult_2;
    assign out_mult = out_mult_32[23:8];
    assign in_mult_1 = s1_rom ? rom_out : out_x;
    assign in_mult_2 = s2_x ? out_x : out_tmp;

    //ADD/SUB
    wire [15:0] in_add_1, in_add_2;
    wire [15:0] out_add;
    assign out_add = sub ? in_add_2 - in_add_1 :
                           in_add_2 + in_add_1;
    assign in_add_1 = out_tmp;
    assign in_add_2 = out_ans;

    //CMP
    wire [15:0] in_cmp_1, in_cmp_2;
    assign in_cmp_1 = {8'b0, out_y};
    assign in_cmp_2 = out_tmp;
    assign less_cmp = in_cmp_2 < in_cmp_1;

    // reg x
    wire [15:0] in_x;
    assign in_x = s4_in ? x : out_mult;
    always @(posedge clk) begin
        if (ld_x)
            out_x <= in_x;
    end

    //reg tmp
    wire [15:0] in_tmp;
    assign in_tmp = out_mult;
    always @(posedge clk, posedge init_tmp) begin
        if (init_tmp)
            out_tmp <= default_tmp;
        if (ld_tmp)
            out_tmp <= in_tmp;
    end
    
    //reg ans
    wire [15:0] in_ans;
    assign in_ans = out_add;
    always @(posedge clk, posedge init_ans) begin
        if (init_ans)
            out_ans <= default_ans;
        if (ld_ans)
            out_ans <= in_ans;
    end
    
    //ROM
    always @(s3) begin
        case(s3)
            0: rom_out = 16'h0080;
            1: rom_out = 16'h0019;
            2: rom_out = 16'h0008;
            3: rom_out = 16'h0004;
            4: rom_out = 16'h0002;
            5: rom_out = 16'h0001;
            6: rom_out = 16'h0001;
            7: rom_out = 16'h0001;
        endcase
    end

    //reg y
    always @(posedge clk) begin
        if (ld_y)
            out_y <= in_y;
    end
    
endmodule
