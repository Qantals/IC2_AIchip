`timescale 1ns/1ps
module inner_dot_sel #(
    parameter SUM_WIDTH = 21
)(
    input clk,
    input rst_n,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(69)-1:0] cnt,

    input [7:0] data0_sel0,
    input [7:0] data1_sel0,
    input [7:0] data2_sel0,
    input [7:0] data3_sel0,
    input [7:0] data4_sel0,
    input [7:0] data5_sel0,
    input [7:0] data6_sel0,
    input [7:0] data7_sel0,
    input [7:0] data8_sel0,

    input [7:0] data0_sel1,
    input [7:0] data1_sel1,
    input [7:0] data2_sel1,
    input [7:0] data3_sel1,
    input [7:0] data4_sel1,
    input [7:0] data5_sel1,
    input [7:0] data6_sel1,
    input [7:0] data7_sel1,
    input [7:0] data8_sel1,

    input [7:0] weight0_sel0,
    input [7:0] weight1_sel0,
    input [7:0] weight2_sel0,
    input [7:0] weight3_sel0,
    input [7:0] weight4_sel0,
    input [7:0] weight5_sel0,
    input [7:0] weight6_sel0,
    input [7:0] weight7_sel0,
    input [7:0] weight8_sel0,

    input [7:0] weight0_sel1,
    input [7:0] weight1_sel1,
    input [7:0] weight2_sel1,
    input [7:0] weight3_sel1,
    input [7:0] weight4_sel1,
    input [7:0] weight5_sel1,
    input [7:0] weight6_sel1,
    input [7:0] weight7_sel1,
    input [7:0] weight8_sel1,

    output [SUM_WIDTH-1:0] dot
);

    wire sel;
    // assign sel = (cnt == 66);   // 0->conv, 1->connect
    assign sel = (cnt == 67);   // 0->conv, 1->connect

    wire [7:0] data0;
    wire [7:0] data1;
    wire [7:0] data2;
    wire [7:0] data3;
    wire [7:0] data4;
    wire [7:0] data5;
    wire [7:0] data6;
    wire [7:0] data7;
    wire [7:0] data8;

    assign data0 = sel ? data0_sel1 : data0_sel0;
    assign data1 = sel ? data1_sel1 : data1_sel0;
    assign data2 = sel ? data2_sel1 : data2_sel0;
    assign data3 = sel ? data3_sel1 : data3_sel0;
    assign data4 = sel ? data4_sel1 : data4_sel0;
    assign data5 = sel ? data5_sel1 : data5_sel0;
    assign data6 = sel ? data6_sel1 : data6_sel0;
    assign data7 = sel ? data7_sel1 : data7_sel0;
    assign data8 = sel ? data8_sel1 : data8_sel0;

    wire [7:0] weight0;
    wire [7:0] weight1;
    wire [7:0] weight2;
    wire [7:0] weight3;
    wire [7:0] weight4;
    wire [7:0] weight5;
    wire [7:0] weight6;
    wire [7:0] weight7;
    wire [7:0] weight8;

    assign weight0 = sel ? weight0_sel1 : weight0_sel0;
    assign weight1 = sel ? weight1_sel1 : weight1_sel0;
    assign weight2 = sel ? weight2_sel1 : weight2_sel0;
    assign weight3 = sel ? weight3_sel1 : weight3_sel0;
    assign weight4 = sel ? weight4_sel1 : weight4_sel0;
    assign weight5 = sel ? weight5_sel1 : weight5_sel0;
    assign weight6 = sel ? weight6_sel1 : weight6_sel0;
    assign weight7 = sel ? weight7_sel1 : weight7_sel0;
    assign weight8 = sel ? weight8_sel1 : weight8_sel0;

    inner_dot_T2_utility #(
        .SUM_WIDTH(SUM_WIDTH)
    ) u_inner_dot_D1(
        .clk(clk),
        .rst_n(rst_n),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),
        .weight0(weight0),
        .weight1(weight1),
        .weight2(weight2),
        .weight3(weight3),
        .weight4(weight4),
        .weight5(weight5),
        .weight6(weight6),
        .weight7(weight7),
        .weight8(weight8),
        .ans(dot)
    );

endmodule
