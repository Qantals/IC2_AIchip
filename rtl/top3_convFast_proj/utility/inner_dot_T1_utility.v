`timescale 1ns/1ps
module inner_dot_T1_utility #(
    parameter SUM_WIDTH = 20
)(
    input signed [7:0] data0,
    input signed [7:0] data1,
    input signed [7:0] data2,
    input signed [7:0] data3,
    input signed [7:0] data4,
    input signed [7:0] data5,
    input signed [7:0] data6,
    input signed [7:0] data7,
    input signed [7:0] data8,
    input signed [7:0] weight0,
    input signed [7:0] weight1,
    input signed [7:0] weight2,
    input signed [7:0] weight3,
    input signed [7:0] weight4,
    input signed [7:0] weight5,
    input signed [7:0] weight6,
    input signed [7:0] weight7,
    input signed [7:0] weight8,
    output signed [SUM_WIDTH-1:0] ans
);

    wire signed [15:0] product0,product1,product2,product3,product4,product5,product6,product7,product8;
    assign product0 = data0 * weight0;
    assign product1 = data1 * weight1;
    assign product2 = data2 * weight2;
    assign product3 = data3 * weight3;
    assign product4 = data4 * weight4;
    assign product5 = data5 * weight5;
    assign product6 = data6 * weight6;
    assign product7 = data7 * weight7;
    assign product8 = data8 * weight8;

    wire signed [SUM_WIDTH-1:0] sum0,sum1,sum2,sum3;
    assign sum0 = product0 + product1;
    assign sum1 = product2 + product3;
    assign sum2 = product4 + product5;
    assign sum3 = product6 + product7;

    wire signed [SUM_WIDTH-1:0] sum00,sum11;
    assign sum00 = sum0 + sum1;
    assign sum11 = sum2 + sum3;

    wire signed [SUM_WIDTH-1:0] sum000;
    assign sum000 = sum00 + sum11;


    // assign ans = ($signed(sum_accum[19:8]) > 127) ? 8'd127 : (($signed(sum_accum[19:8]) < -128) ? -8'd128 : $signed(sum_accum[15:8]));
    assign ans = sum000 + product8;

endmodule