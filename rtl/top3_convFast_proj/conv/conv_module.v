`timescale 1ns/1ps
module conv_module (
    input clk,
    input rst_n,
    input in_vld,
    input [8*8*1*8-1:0] data_lin,
    input [3*3*3*8-1:0] weight_lin,

    output [6*6*3*8-1:0] conv_lin,
    output out_vld
);

    // cnt_rc
    wire out_vld_rc;
    wire [5:0] cnt_rc;
    counter_utility #(
        .CNT_WIDTH(6),
        .CNT_MAX(35)
    ) u_conv_rc_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_rc),
        .out_vld(out_vld_rc)
    );


    // data mux window
    wire [7:0] data0,data1,data2,data3,data4,data5,data6,data7,data8;
    conv_mux_data_win u_conv_mux_data_win(
        .cnt(cnt_rc),
        .data_lin(data_lin),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8)
    );

    // calculate unit
    wire [7:0] ans_3x3_D1;
    wire [7:0] ans_3x3_D2;
    wire [7:0] ans_3x3_D3;
    conv_3x3 u_conv_3x3_D1(
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),
        .weight0(weight_lin[(0*9  )*8 +: 8]),
        .weight1(weight_lin[(0*9+1)*8 +: 8]),
        .weight2(weight_lin[(0*9+2)*8 +: 8]),
        .weight3(weight_lin[(0*9+3)*8 +: 8]),
        .weight4(weight_lin[(0*9+4)*8 +: 8]),
        .weight5(weight_lin[(0*9+5)*8 +: 8]),
        .weight6(weight_lin[(0*9+6)*8 +: 8]),
        .weight7(weight_lin[(0*9+7)*8 +: 8]),
        .weight8(weight_lin[(0*9+8)*8 +: 8]),
        .ans(ans_3x3_D1)
    );
    conv_3x3 u_conv_3x3_D2(
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),
        .weight0(weight_lin[(1*9  )*8 +: 8]),
        .weight1(weight_lin[(1*9+1)*8 +: 8]),
        .weight2(weight_lin[(1*9+2)*8 +: 8]),
        .weight3(weight_lin[(1*9+3)*8 +: 8]),
        .weight4(weight_lin[(1*9+4)*8 +: 8]),
        .weight5(weight_lin[(1*9+5)*8 +: 8]),
        .weight6(weight_lin[(1*9+6)*8 +: 8]),
        .weight7(weight_lin[(1*9+7)*8 +: 8]),
        .weight8(weight_lin[(1*9+8)*8 +: 8]),
        .ans(ans_3x3_D2)
    );
    conv_3x3 u_conv_3x3_D3(
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),
        .weight0(weight_lin[(2*9  )*8 +: 8]),
        .weight1(weight_lin[(2*9+1)*8 +: 8]),
        .weight2(weight_lin[(2*9+2)*8 +: 8]),
        .weight3(weight_lin[(2*9+3)*8 +: 8]),
        .weight4(weight_lin[(2*9+4)*8 +: 8]),
        .weight5(weight_lin[(2*9+5)*8 +: 8]),
        .weight6(weight_lin[(2*9+6)*8 +: 8]),
        .weight7(weight_lin[(2*9+7)*8 +: 8]),
        .weight8(weight_lin[(2*9+8)*8 +: 8]),
        .ans(ans_3x3_D3)
    );

    // storage to register
    conv_storage u_conv_storage(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_rc),
        .ans_3x3_D1(ans_3x3_D1),
        .ans_3x3_D2(ans_3x3_D2),
        .ans_3x3_D3(ans_3x3_D3),
        .conv_lin(conv_lin)
    );

    // gen out_vld
    out_vld_utility u_pool_out_vld(
        .clk(clk),
        .rst_n(rst_n),
        .out_vld(out_vld_rc),
        .out_vld_reg(out_vld)
    );



endmodule
