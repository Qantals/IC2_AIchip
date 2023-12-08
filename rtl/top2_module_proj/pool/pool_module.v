`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    input [6*6*3*8-1:0] conv_lin,

    output [3*3*3*8-1:0] pool_lin,
    output out_vld
);

    // cnt_rc
    wire out_vld_rc;
    wire [3:0] cnt_rc;
    counter_utility #(
        .CNT_WIDTH(4),
        .CNT_MAX(8)
    ) u_pool_rc_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_rc),
        .out_vld(out_vld_rc)
    );

    // data mux window
    wire [7:0] conv0_D1,conv0_D2,conv0_D3;
    wire [7:0] conv1_D1,conv1_D2,conv1_D3;
    wire [7:0] conv2_D1,conv2_D2,conv2_D3;
    wire [7:0] conv3_D1,conv3_D2,conv3_D3;
    pool_mux_data_win u_pool_mux_data_win_D1(
        .cnt(cnt_rc),
        .conv_lin(conv_lin[6*6*1*8-1:0]),
        .conv0(conv0_D1),
        .conv1(conv1_D1),
        .conv2(conv2_D1),
        .conv3(conv3_D1)
    );
    pool_mux_data_win u_pool_mux_data_win_D2(
        .cnt(cnt_rc),
        .conv_lin(conv_lin[6*6*2*8-1 : 6*6*1*8]),
        .conv0(conv0_D2),
        .conv1(conv1_D2),
        .conv2(conv2_D2),
        .conv3(conv3_D2)
    );
    pool_mux_data_win u_pool_mux_data_win_D3(
        .cnt(cnt_rc),
        .conv_lin(conv_lin[6*6*3*8-1 : 6*6*2*8]),
        .conv0(conv0_D3),
        .conv1(conv1_D3),
        .conv2(conv2_D3),
        .conv3(conv3_D3)
    );

    // calculate unit
    wire [7:0] ans_2x2_D1;
    wire [7:0] ans_2x2_D2;
    wire [7:0] ans_2x2_D3;
    pool_2x2 u_pool_2x2_D1(
        .conv0(conv0_D1),
        .conv1(conv1_D1),
        .conv2(conv2_D1),
        .conv3(conv3_D1),
        .max(ans_2x2_D1)
    );
    pool_2x2 u_pool_2x2_D2(
        .conv0(conv0_D2),
        .conv1(conv1_D2),
        .conv2(conv2_D2),
        .conv3(conv3_D2),
        .max(ans_2x2_D2)
    );
    pool_2x2 u_pool_2x2_D3(
        .conv0(conv0_D3),
        .conv1(conv1_D3),
        .conv2(conv2_D3),
        .conv3(conv3_D3),
        .max(ans_2x2_D3)
    );

    // storage to register
    pool_storage u_pool_storage(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_rc),
        .ans_2x2_D1(ans_2x2_D1),
        .ans_2x2_D2(ans_2x2_D2),
        .ans_2x2_D3(ans_2x2_D3),
        .pool_lin(pool_lin)
    );

    // gen out_vld
    out_vld_utility u_pool_out_vld(
        .clk(clk),
        .rst_n(rst_n),
        .out_vld(out_vld_rc),
        .out_vld_reg(out_vld)
    );


endmodule
