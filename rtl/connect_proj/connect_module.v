`timescale 1ns/1ps
module connect_module (
    input clk,
    input rst_n,
    input in_vld,
    input [3*3*3*8-1:0] pool_lin,
    input [3*3*3*8-1:0] weight_lin,

    output signed [7:0] ans_reg,
    output out_vld
);

    wire [3:0] cnt_3x3;
    wire [7:0] data_D1,data_D2,data_D3;
    connect_mux_data u_connect_mux_data_D1(
        .cnt(cnt_3x3),
        .pool_lin(pool_lin[3*3*1*8-1:0]),
        .data(data_D1)
    );
    connect_mux_data u_connect_mux_data_D2(
        .cnt(cnt_3x3),
        .pool_lin(pool_lin[3*3*2*8-1 : 3*3*1*8]),
        .data(data_D2)
    );
    connect_mux_data u_connect_mux_data_D3(
        .cnt(cnt_3x3),
        .pool_lin(pool_lin[3*3*3*8-1 : 3*3*2*8]),
        .data(data_D3)
    );

    wire [7:0] weight_D1,weight_D2,weight_D3;
    connect_mux_weight u_connect_mux_weight_D1(
        .cnt(cnt_3x3),
        .weight_lin(weight_lin[3*3*1*8-1:0]),
        .weight(weight_D1)
    );
    connect_mux_weight u_connect_mux_weight_D2(
        .cnt(cnt_3x3),
        .weight_lin(weight_lin[3*3*2*8-1 : 3*3*1*8]),
        .weight(weight_D2)
    );
    connect_mux_weight u_connect_mux_weight_D3(
        .cnt(cnt_3x3),
        .weight_lin(weight_lin[3*3*3*8-1 : 3*3*2*8]),
        .weight(weight_D3)
    );


    wire [20:0] ans_3x3_D1;
    wire [20:0] ans_3x3_D2;
    wire [20:0] ans_3x3_D3;
    connect3x3 u_connect3x3_D1(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data(data_D1),
        .weight(weight_D1),
        .ans(ans_3x3_D1)
    );
    connect3x3 u_connect3x3_D2(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data(data_D2),
        .weight(weight_D2),
        .ans(ans_3x3_D2)
    );
    connect3x3 u_connect3x3_D3(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data(data_D3),
        .weight(weight_D3),
        .ans(ans_3x3_D3)
    );


    wire out_vld_3x3;
    connect3x3_cnt u_connect3x3_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_3x3),
        .out_vld(out_vld_3x3)
    );

    connect_out_vld u_connect_out_vld(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .out_vld_3x3(out_vld_3x3),
        .out_vld(out_vld)
    );

    connect_sum u_connect_sum(
        .clk(clk),
        .rst_n(rst_n),
        .out_vld_3x3(out_vld_3x3),
        .ans_3x3_D1(ans_3x3_D1),
        .ans_3x3_D2(ans_3x3_D2),
        .ans_3x3_D3(ans_3x3_D3),
        .ans_reg(ans_reg)
    );

endmodule
