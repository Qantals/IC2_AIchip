`timescale 1ns/1ps
module conv_3x3 #(
    parameter SUM_WIDTH = 20
)(
    input clk,
    input rst_n,
    input accum_clr,
    input [7:0] data,
    input [7:0] weight,
    output [7:0] ans
);

    wire [19:0] dot;
    inner_dot_T9_utility #(
        .SUM_WIDTH(SUM_WIDTH)
    ) u_conv_3x3_inner_dot(
        .clk(clk),
        .rst_n(rst_n),
        .accum_clr(accum_clr),
        .data(data),
        .weight(weight),
        .ans(dot)
    );

    compress_utility #(
        .SUM_WIDTH(SUM_WIDTH)
    ) u_conv_3x3_compress(
        .sum_accum(dot),
        .ans(ans)
    );

endmodule