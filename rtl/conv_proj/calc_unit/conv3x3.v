`timescale 1ns/1ps
module conv3x3 (
    input clk,
    input rst_n,
    input [3:0] cnt,

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

    output signed [7:0] ans
);


    reg signed [15:0] product;
    always @(*) begin
        case (cnt)
            0: product = data0 * weight0;
            1: product = data1 * weight1;
            2: product = data2 * weight2;
            3: product = data3 * weight3;
            4: product = data4 * weight4;
            5: product = data5 * weight5;
            6: product = data6 * weight6;
            7: product = data7 * weight7;
            8: product = data8 * weight8;
            9: product = 0;
            default: product = 0;
        endcase
    end

    reg signed [19:0] sum_accum;
    wire signed [19:0] nxt_sum;
    assign nxt_sum = (cnt == 0) ? (0 + product) : (sum_accum + product);
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            sum_accum <= 0;
        else
            sum_accum <= nxt_sum;
    end

    assign ans = ($signed(sum_accum[19:8]) > 127) ? 8'd127 : (($signed(sum_accum[19:8]) < -128) ? -8'd128 : $signed(sum_accum[15:8]));
    
endmodule