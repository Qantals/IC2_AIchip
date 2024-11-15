`timescale 1ns/1ps
module conv_3x3 (
    input [7:0] data0,
    input [7:0] data1,
    input [7:0] data2,
    input [7:0] data3,
    input [7:0] data4,
    input [7:0] data5,
    input [7:0] data6,
    input [7:0] data7,
    input [7:0] data8,
    input [7:0] weight0,
    input [7:0] weight1,
    input [7:0] weight2,
    input [7:0] weight3,
    input [7:0] weight4,
    input [7:0] weight5,
    input [7:0] weight6,
    input [7:0] weight7,
    input [7:0] weight8,
    output [7:0] ans
);

    wire [19:0] dot;
    inner_dot_T1_utility #(
        .SUM_WIDTH(20)
    ) u_conv_3x3_inner_dot(
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

    compress_utility #(
        .SUM_WIDTH(20)
    ) u_conv_3x3_compress(
        .sum_accum(dot),
        .ans(ans)
    );

endmodule