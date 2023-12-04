`timescale 1ns/1ps
module conv_module (
    input clk,
    input rst_n,
    input in_valid,
    // input [8*8*1*8-1:0] data_lin,
    // input [3*3*3*8-1:0] weight_lin,

    // output reg [6*6*3*8-1:0] conv_lin
    output reg out_valid
);


    wire in_valid_pulse;
    reg in_valid_reg;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            in_valid_reg <= 0;
        else
            in_valid_reg <= in_valid;
    end
    assign in_valid_pulse = (in_valid == 1 && in_valid_reg == 0);



    wire out_valid_3x3;
    reg [2:0] r_cnt,c_cnt; // max=6
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            r_cnt <= 0;
            c_cnt <= 0;
            out_valid <= 0;
        end
        else if(in_valid == 1 && out_valid_3x3 == 1)begin
            if(c_cnt == 5) begin
                c_cnt <= 0;
                if(r_cnt == 5) begin
                    r_cnt <= 0;
                    out_valid <= 1;
                end
                else begin
                    r_cnt <= r_cnt + 1;
                end
            end
            else begin
                c_cnt <= c_cnt + 1;
            end
        end
    end



    reg in_valid_3x3;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            in_valid_3x3 <= 0;
        // else if(in_valid == 1 && (out_valid_3x3 == 1 || in_valid_pulse == 1))
        else if(in_valid == 1)
            in_valid_3x3 <= 1;
        else
            in_valid_3x3 <= 0;
    end



    // wire ans_3x3;
    // conv3x3_t9 u_conv8_9_D1(
    //     .clk(clk),
    //     .rst_n(rst_n),
    //     .in_valid(in_valid_3x3),

    //     .data0(data_lin[(r_cnt*8+c_cnt   )*8 +: 8]),
    //     .data1(data_lin[(r_cnt*8+c_cnt+1 )*8 +: 8]),
    //     .data2(data_lin[(r_cnt*8+c_cnt+2 )*8 +: 8]),
    //     .data3(data_lin[(r_cnt*8+c_cnt+8 )*8 +: 8]),
    //     .data4(data_lin[(r_cnt*8+c_cnt+9 )*8 +: 8]),
    //     .data5(data_lin[(r_cnt*8+c_cnt+10)*8 +: 8]),
    //     .data6(data_lin[(r_cnt*8+c_cnt+16)*8 +: 8]),
    //     .data7(data_lin[(r_cnt*8+c_cnt+17)*8 +: 8]),
    //     .data8(data_lin[(r_cnt*8+c_cnt+18)*8 +: 8]),

    //     .weight0(weight_lin[(0*9  )*8 +: 8]),
    //     .weight1(weight_lin[(0*9+1)*8 +: 8]),
    //     .weight2(weight_lin[(0*9+2)*8 +: 8]),
    //     .weight3(weight_lin[(0*9+3)*8 +: 8]),
    //     .weight4(weight_lin[(0*9+4)*8 +: 8]),
    //     .weight5(weight_lin[(0*9+5)*8 +: 8]),
    //     .weight6(weight_lin[(0*9+6)*8 +: 8]),
    //     .weight7(weight_lin[(0*9+7)*8 +: 8]),
    //     .weight8(weight_lin[(0*9+8)*8 +: 8]),

    //     .ans(ans_3x3),
    //     .out_valid(out_valid_3x3)
    // );
    test_cnt u_test_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid_3x3),
        .out_valid(out_valid_3x3)
    );

    // always @(posedge clk, negedge rst_n) begin
    //     if(~rst_n)
    //         conv_lin <= 0;
    //     else if(out_valid_3x3)
    //         conv_lin[(0*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3;
    // end





endmodule
