`timescale 1ns/1ps
module inner_dot_T2_utility #(
    parameter SUM_WIDTH = 20
)(
    input clk,
    input rst_n,
    input in_vld,
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

    // registers
    reg signed [15:0] product0_reg;
    reg signed [15:0] product1_reg;
    reg signed [15:0] product2_reg;
    reg signed [15:0] product3_reg;
    reg signed [15:0] product4_reg;
    reg signed [15:0] product5_reg;
    reg signed [15:0] product6_reg;
    reg signed [15:0] product7_reg;
    reg signed [15:0] product8_reg;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            product0_reg <= 0;
            product1_reg <= 0;
            product2_reg <= 0;
            product3_reg <= 0;
            product4_reg <= 0;
            product5_reg <= 0;
            product6_reg <= 0;
            product7_reg <= 0;
            product8_reg <= 0;
        end
        else if(in_vld)begin
            product0_reg <= product0;
            product1_reg <= product1;
            product2_reg <= product2;
            product3_reg <= product3;
            product4_reg <= product4;
            product5_reg <= product5;
            product6_reg <= product6;
            product7_reg <= product7;
            product8_reg <= product8;
        end
    end



    wire signed [SUM_WIDTH-1:0] sum0,sum1,sum2,sum3;
    assign sum0 = product0_reg + product1_reg;
    assign sum1 = product2_reg + product3_reg;
    assign sum2 = product4_reg + product5_reg;
    assign sum3 = product6_reg + product7_reg;

    wire signed [SUM_WIDTH-1:0] sum00,sum11;
    assign sum00 = sum0 + sum1;
    assign sum11 = sum2 + sum3;

    wire signed [SUM_WIDTH-1:0] sum000;
    assign sum000 = sum00 + sum11;


    assign ans = sum000 + product8_reg;

endmodule