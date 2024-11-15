`timescale 1ns/1ps
module connect_integra (
    input clk,
    input rst_n,
    input in_vld,
    input signed [20:0] ans_D1,
    input signed [20:0] ans_D2,
    input signed [20:0] ans_D3,
    output [7:0] ans_reg
);

    // sum up
    wire [20:0] sum_all;
    connect_integra_sum u_connect_integra_sum(
        .ans_D1(ans_D1),
        .ans_D2(ans_D2),
        .ans_D3(ans_D3),
        .sum_all(sum_all)
    );

    // compress
    wire [7:0] ans;
    compress_utility #(
        .SUM_WIDTH(21)
    ) u_conv_3x3_compress(
        .sum_accum(sum_all),
        .ans(ans)
    );

    // register
    connect_storage u_connect_storage(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .ans(ans),
        .ans_reg(ans_reg)
    );



endmodule
