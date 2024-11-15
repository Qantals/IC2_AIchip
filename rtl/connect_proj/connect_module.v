`timescale 1ns/1ps
module connect_module (
    input clk,
    input rst_n,
    input in_vld,
    input [3*3*3*8-1:0] pool_lin,
    input [3*3*3*8-1:0] weight_lin,

    output [7:0] ans_reg,
    output out_vld
);

    // cnt_3x3
    wire out_vld_3x3;
    wire [3:0] cnt_3x3;
    counter_utility #(
        .CNT_WIDTH(4),
        .CNT_MAX(9)
    ) u_connect_3x3_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_3x3),
        .out_vld(out_vld_3x3)
    );

    // accum_clr
    wire accum_clr;
    accum_clr_utility u_connect_accum_clr(
        .cnt(cnt_3x3),
        .accum_clr(accum_clr)
    );

    // data mux 3x3
    wire [7:0] data_D1,data_D2,data_D3;
    mux_3x3_utility u_connect_mux_data_D1(
        .cnt(cnt_3x3),
        .data0(pool_lin[(0*9+0)*8 +: 8]),
        .data1(pool_lin[(0*9+1)*8 +: 8]),
        .data2(pool_lin[(0*9+2)*8 +: 8]),
        .data3(pool_lin[(0*9+3)*8 +: 8]),
        .data4(pool_lin[(0*9+4)*8 +: 8]),
        .data5(pool_lin[(0*9+5)*8 +: 8]),
        .data6(pool_lin[(0*9+6)*8 +: 8]),
        .data7(pool_lin[(0*9+7)*8 +: 8]),
        .data8(pool_lin[(0*9+8)*8 +: 8]),
        .data(data_D1)
    );
    mux_3x3_utility u_connect_mux_data_D2(
        .cnt(cnt_3x3),
        .data0(pool_lin[(1*9+0)*8 +: 8]),
        .data1(pool_lin[(1*9+1)*8 +: 8]),
        .data2(pool_lin[(1*9+2)*8 +: 8]),
        .data3(pool_lin[(1*9+3)*8 +: 8]),
        .data4(pool_lin[(1*9+4)*8 +: 8]),
        .data5(pool_lin[(1*9+5)*8 +: 8]),
        .data6(pool_lin[(1*9+6)*8 +: 8]),
        .data7(pool_lin[(1*9+7)*8 +: 8]),
        .data8(pool_lin[(1*9+8)*8 +: 8]),
        .data(data_D2)
    );
    mux_3x3_utility u_connect_mux_data_D3(
        .cnt(cnt_3x3),
        .data0(pool_lin[(2*9+0)*8 +: 8]),
        .data1(pool_lin[(2*9+1)*8 +: 8]),
        .data2(pool_lin[(2*9+2)*8 +: 8]),
        .data3(pool_lin[(2*9+3)*8 +: 8]),
        .data4(pool_lin[(2*9+4)*8 +: 8]),
        .data5(pool_lin[(2*9+5)*8 +: 8]),
        .data6(pool_lin[(2*9+6)*8 +: 8]),
        .data7(pool_lin[(2*9+7)*8 +: 8]),
        .data8(pool_lin[(2*9+8)*8 +: 8]),
        .data(data_D3)
    );

    // weight mux 3x3
    wire [7:0] weight_D1,weight_D2,weight_D3;
    mux_3x3_utility u_connect_mux_weight_D1(
        .cnt(cnt_3x3),
        .data0(weight_lin[(0*9+0)*8 +: 8]),
        .data1(weight_lin[(0*9+1)*8 +: 8]),
        .data2(weight_lin[(0*9+2)*8 +: 8]),
        .data3(weight_lin[(0*9+3)*8 +: 8]),
        .data4(weight_lin[(0*9+4)*8 +: 8]),
        .data5(weight_lin[(0*9+5)*8 +: 8]),
        .data6(weight_lin[(0*9+6)*8 +: 8]),
        .data7(weight_lin[(0*9+7)*8 +: 8]),
        .data8(weight_lin[(0*9+8)*8 +: 8]),
        .data(weight_D1)
    );
    mux_3x3_utility u_connect_mux_weight_D2(
        .cnt(cnt_3x3),
        .data0(weight_lin[(1*9+0)*8 +: 8]),
        .data1(weight_lin[(1*9+1)*8 +: 8]),
        .data2(weight_lin[(1*9+2)*8 +: 8]),
        .data3(weight_lin[(1*9+3)*8 +: 8]),
        .data4(weight_lin[(1*9+4)*8 +: 8]),
        .data5(weight_lin[(1*9+5)*8 +: 8]),
        .data6(weight_lin[(1*9+6)*8 +: 8]),
        .data7(weight_lin[(1*9+7)*8 +: 8]),
        .data8(weight_lin[(1*9+8)*8 +: 8]),
        .data(weight_D2)
    );
    mux_3x3_utility u_connect_mux_weight_D3(
        .cnt(cnt_3x3),
        .data0(weight_lin[(2*9+0)*8 +: 8]),
        .data1(weight_lin[(2*9+1)*8 +: 8]),
        .data2(weight_lin[(2*9+2)*8 +: 8]),
        .data3(weight_lin[(2*9+3)*8 +: 8]),
        .data4(weight_lin[(2*9+4)*8 +: 8]),
        .data5(weight_lin[(2*9+5)*8 +: 8]),
        .data6(weight_lin[(2*9+6)*8 +: 8]),
        .data7(weight_lin[(2*9+7)*8 +: 8]),
        .data8(weight_lin[(2*9+8)*8 +: 8]),
        .data(weight_D3)
    );

    // calculate unit
    wire [20:0] ans_D1;
    wire [20:0] ans_D2;
    wire [20:0] ans_D3;
    inner_dot_T9_utility #(
        .SUM_WIDTH(21)
    ) u_connect_3x3_D1(
        .clk(clk),
        .rst_n(rst_n),
        .accum_clr(accum_clr),
        .data(data_D1),
        .weight(weight_D1),
        .ans(ans_D1)
    );
    inner_dot_T9_utility #(
        .SUM_WIDTH(21)
    ) u_connect_3x3_D2(
        .clk(clk),
        .rst_n(rst_n),
        .accum_clr(accum_clr),
        .data(data_D2),
        .weight(weight_D2),
        .ans(ans_D2)
    );
    inner_dot_T9_utility #(
        .SUM_WIDTH(21)
    ) u_connect_3x3_D3(
        .clk(clk),
        .rst_n(rst_n),
        .accum_clr(accum_clr),
        .data(data_D3),
        .weight(weight_D3),
        .ans(ans_D3)
    );

    // integration for 3 dimensions
    connect_integra u_connect_integra(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(out_vld_3x3),
        .ans_D1(ans_D1),
        .ans_D2(ans_D2),
        .ans_D3(ans_D3),
        .ans_reg(ans_reg)
    );

    // get out_vld
    out_vld_utility u_connect_out_vld(
        .clk(clk),
        .rst_n(rst_n),
        .out_vld(out_vld_3x3),
        .out_vld_reg(out_vld)
    );

endmodule
