`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    input [6*6*3*8-1:0] conv_lin,

    output [3*3*3*8-1:0] pool_lin,
    output out_vld
);

    wire [1:0] r_cnt,c_cnt;
    pool_rc_cnt u_pool_rc_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),

        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .out_vld(out_vld)
    );

    wire [7:0] conv0_D1,conv0_D2,conv0_D3;
    wire [7:0] conv1_D1,conv1_D2,conv1_D3;
    wire [7:0] conv2_D1,conv2_D2,conv2_D3;
    wire [7:0] conv3_D1,conv3_D2,conv3_D3;
    pool_mux_data u_pool_mux_data_D1(
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .conv_lin(conv_lin[6*6*1*8-1:0]),

        .conv0(conv0_D1),
        .conv1(conv1_D1),
        .conv2(conv2_D1),
        .conv3(conv3_D1)
    );
    pool_mux_data u_pool_mux_data_D2(
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .conv_lin(conv_lin[6*6*2*8-1 : 6*6*1*8]),

        .conv0(conv0_D2),
        .conv1(conv1_D2),
        .conv2(conv2_D2),
        .conv3(conv3_D2)
    );
    pool_mux_data u_pool_mux_data_D3(
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .conv_lin(conv_lin[6*6*3*8-1 : 6*6*2*8]),

        .conv0(conv0_D3),
        .conv1(conv1_D3),
        .conv2(conv2_D3),
        .conv3(conv3_D3)
    );


    wire [7:0] ans_2x2_D1;
    wire [7:0] ans_2x2_D2;
    wire [7:0] ans_2x2_D3;
    pool2x2 u_pool2x2_D1(
        .conv0(conv0_D1),
        .conv1(conv1_D1),
        .conv2(conv2_D1),
        .conv3(conv3_D1),

        .max(ans_2x2_D1)
    );
    pool2x2 u_pool2x2_D2(
        .conv0(conv0_D2),
        .conv1(conv1_D2),
        .conv2(conv2_D2),
        .conv3(conv3_D2),

        .max(ans_2x2_D2)
    );
    pool2x2 u_pool2x2_D3(
        .conv0(conv0_D3),
        .conv1(conv1_D3),
        .conv2(conv2_D3),
        .conv3(conv3_D3),

        .max(ans_2x2_D3)
    );

    pool_storage u_pool_storage(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .ans_2x2_D1(ans_2x2_D1),
        .ans_2x2_D2(ans_2x2_D2),
        .ans_2x2_D3(ans_2x2_D3),

        .pool_lin(pool_lin)
    );


endmodule
