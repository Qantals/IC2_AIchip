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

    wire out_vld_3x3;
    wire out_vld_rc;
    wire [5:0] cnt_rc;
    counter_utility #(
        .CNT_WIDTH(6),
        .CNT_MAX(35)
    ) u_conv_rc_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(out_vld_3x3),
        .cnt(cnt_rc),
        .out_vld(out_vld_rc)
    );




    wire [7:0] data0,data1,data2,data3,data4,data5,data6,data7,data8;
    conv_mux_data u_conv_mux_data(
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
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

    wire [7:0] data;
    wire [3:0] cnt_3x3;
    conv3x3_mux_data u_conv3x3_mux_data(
        .cnt(cnt_3x3),

        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),

        .data(data)
    );

    wire [7:0] weight_D1;
    wire [7:0] weight_D2;
    wire [7:0] weight_D3;
    conv3x3_mux_weight u_conv3x3_mux_weight_D1(
        .cnt(cnt_3x3),
        .weight0(weight_lin[(0*9  )*8 +: 8]),
        .weight1(weight_lin[(0*9+1)*8 +: 8]),
        .weight2(weight_lin[(0*9+2)*8 +: 8]),
        .weight3(weight_lin[(0*9+3)*8 +: 8]),
        .weight4(weight_lin[(0*9+4)*8 +: 8]),
        .weight5(weight_lin[(0*9+5)*8 +: 8]),
        .weight6(weight_lin[(0*9+6)*8 +: 8]),
        .weight7(weight_lin[(0*9+7)*8 +: 8]),
        .weight8(weight_lin[(0*9+8)*8 +: 8]),
        .weight(weight_D1)
    );
    conv3x3_mux_weight u_conv3x3_mux_weight_D2(
        .cnt(cnt_3x3),
        .weight0(weight_lin[(1*9  )*8 +: 8]),
        .weight1(weight_lin[(1*9+1)*8 +: 8]),
        .weight2(weight_lin[(1*9+2)*8 +: 8]),
        .weight3(weight_lin[(1*9+3)*8 +: 8]),
        .weight4(weight_lin[(1*9+4)*8 +: 8]),
        .weight5(weight_lin[(1*9+5)*8 +: 8]),
        .weight6(weight_lin[(1*9+6)*8 +: 8]),
        .weight7(weight_lin[(1*9+7)*8 +: 8]),
        .weight8(weight_lin[(1*9+8)*8 +: 8]),
        .weight(weight_D2)
    );
    conv3x3_mux_weight u_conv3x3_mux_weight_D3(
        .cnt(cnt_3x3),
        .weight0(weight_lin[(2*9  )*8 +: 8]),
        .weight1(weight_lin[(2*9+1)*8 +: 8]),
        .weight2(weight_lin[(2*9+2)*8 +: 8]),
        .weight3(weight_lin[(2*9+3)*8 +: 8]),
        .weight4(weight_lin[(2*9+4)*8 +: 8]),
        .weight5(weight_lin[(2*9+5)*8 +: 8]),
        .weight6(weight_lin[(2*9+6)*8 +: 8]),
        .weight7(weight_lin[(2*9+7)*8 +: 8]),
        .weight8(weight_lin[(2*9+8)*8 +: 8]),
        .weight(weight_D3)
    );


    wire [7:0] ans_3x3_D1;
    wire [7:0] ans_3x3_D2;
    wire [7:0] ans_3x3_D3;
    conv3x3 u_conv3x3_D1(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),
        .data(data),
        .weight(weight_D1),
        .ans(ans_3x3_D1)
    );
    conv3x3 u_conv3x3_D2(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),
        .data(data),
        .weight(weight_D2),
        .ans(ans_3x3_D2)
    );
    conv3x3 u_conv3x3_D3(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),
        .data(data),
        .weight(weight_D3),
        .ans(ans_3x3_D3)
    );

    wire [5:0] cnt_3x3;
    counter_utility #(
        .CNT_WIDTH(4),
        .CNT_MAX(9)
    ) u_conv_3x3_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(out_vld_3x3),
        .cnt(rc_cnt),
        .out_vld(out_vld_rc)
    );

    // conv3x3_cnt u_conv3x3_cnt(
    //     .clk(clk),
    //     .rst_n(rst_n),
    //     .in_vld(in_vld),

    //     .cnt(cnt_3x3),
    //     .out_vld(out_vld_3x3)
    // );

    conv_storage u_conv_storage(
        .clk(clk),
        .rst_n(rst_n),
        .out_vld_3x3(out_vld_3x3),
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .ans_3x3_D1(ans_3x3_D1),
        .ans_3x3_D2(ans_3x3_D2),
        .ans_3x3_D3(ans_3x3_D3),

        .conv_lin(conv_lin)
    );





endmodule
