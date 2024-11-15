`timescale 1ns/1ps
module inner_dot_sel #(
    parameter SUM_WIDTH = 21
)(
    input clk,
    input rst_n,
    input in_vld,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(68)-1:0] cnt,

    input [7:0] data0_conv,
    input [7:0] data1_conv,
    input [7:0] data2_conv,
    input [7:0] data3_conv,
    input [7:0] data4_conv,
    input [7:0] data5_conv,
    input [7:0] data6_conv,
    input [7:0] data7_conv,
    input [7:0] data8_conv,

    input [7:0] data0_connect,
    input [7:0] data1_connect,
    input [7:0] data2_connect,

    input [7:0] weight0_conv,
    input [7:0] weight1_conv,
    input [7:0] weight2_conv,
    input [7:0] weight3_conv,
    input [7:0] weight4_conv,
    input [7:0] weight5_conv,
    input [7:0] weight6_conv,
    input [7:0] weight7_conv,
    input [7:0] weight8_conv,

    input [7:0] weight0_connect,
    input [7:0] weight1_connect,
    input [7:0] weight2_connect,
    input [7:0] weight3_connect,
    input [7:0] weight4_connect,
    input [7:0] weight5_connect,
    input [7:0] weight6_connect,
    input [7:0] weight7_connect,
    input [7:0] weight8_connect,

    output [SUM_WIDTH-1:0] dot
);  

    reg [7:0] data0;
    reg [7:0] data1;
    reg [7:0] data2;
    reg [7:0] data3;
    reg [7:0] data4;
    reg [7:0] data5;
    reg [7:0] data6;
    reg [7:0] data7;
    reg [7:0] data8;
    always @(*) begin
        case (cnt)
            // 34: begin
            34: begin
                data0 = data0_connect;
                data1 = data1_connect;
                data2 = data2_connect;
                data3 = 8'b0;
                data4 = 8'b0;
                data5 = 8'b0;
                data6 = 8'b0;
                data7 = 8'b0;
                data8 = 8'b0;
            end
            // 50: begin
            50: begin
                data0 = 8'b0;
                data1 = 8'b0;
                data2 = 8'b0;
                data3 = data0_connect;
                data4 = data1_connect;
                data5 = data2_connect;
                data6 = 8'b0;
                data7 = 8'b0;
                data8 = 8'b0;
            end
            // 66: begin
            66: begin
                data0 = 8'b0;
                data1 = 8'b0;
                data2 = 8'b0;
                data3 = 8'b0;
                data4 = 8'b0;
                data5 = 8'b0;
                data6 = data0_connect;
                data7 = data1_connect;
                data8 = data2_connect;
            end
            default: begin
                data0 = data0_conv;
                data1 = data1_conv;
                data2 = data2_conv;
                data3 = data3_conv;
                data4 = data4_conv;
                data5 = data5_conv;
                data6 = data6_conv;
                data7 = data7_conv;
                data8 = data8_conv;
            end
        endcase
    end

    reg [7:0] weight0;
    reg [7:0] weight1;
    reg [7:0] weight2;
    reg [7:0] weight3;
    reg [7:0] weight4;
    reg [7:0] weight5;
    reg [7:0] weight6;
    reg [7:0] weight7;
    reg [7:0] weight8;
    always @(*) begin
        case (cnt)
            // 34,50,66: begin
            34,50,66: begin
                weight0 = weight0_connect;
                weight1 = weight1_connect;
                weight2 = weight2_connect;
                weight3 = weight3_connect;
                weight4 = weight4_connect;
                weight5 = weight5_connect;
                weight6 = weight6_connect;
                weight7 = weight7_connect;
                weight8 = weight8_connect;
            end
            default: begin
                weight0 = weight0_conv;
                weight1 = weight1_conv;
                weight2 = weight2_conv;
                weight3 = weight3_conv;
                weight4 = weight4_conv;
                weight5 = weight5_conv;
                weight6 = weight6_conv;
                weight7 = weight7_conv;
                weight8 = weight8_conv;
            end
        endcase
    end

    inner_dot_T2_utility #(
        .SUM_WIDTH(SUM_WIDTH)
    ) u_inner_dot_D1(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
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
