`timescale 1ns/1ps
module conv3x3 (
    input clk,
    input rst_n,
    input [3:0] cnt,
    input signed [7:0] data,
    input signed [7:0] weight,
    output signed [7:0] ans
);

    wire signed [15:0] product;
    assign product = data * weight;


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