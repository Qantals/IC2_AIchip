`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(69)-1:0] cnt,
    input [7:0] conv_D1,
    input [7:0] conv_D2,
    input [7:0] conv_D3,

    output [3*3*3*8-1:0] pool_lin
);

    // calculate unit
    pool_2x2 u_pool_2x2_D1(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),
        .conv(conv_D1),
        .pool_lin_reg(pool_lin[3*3*8-1:0])
    );
    pool_2x2 u_pool_2x2_D2(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),
        .conv(conv_D2),
        .pool_lin_reg(pool_lin[3*3*2*8-1:3*3*8])
    );
    pool_2x2 u_pool_2x2_D3(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),
        .conv(conv_D3),
        .pool_lin_reg(pool_lin[3*3*3*8-1:3*3*2*8])
    );

endmodule
