`timescale 1ns/1ps
module connect_module (
    input clk,
    input rst_n,
    input in_vld,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(69)-1:0] cnt,

    input signed [20:0] dot_D1,
    input signed [20:0] dot_D2,
    input signed [20:0] dot_D3,

    output signed [20:0] sum_all,
    input [7:0] compress,

    output reg [7:0] ans_reg
);

    reg signed [20:0] ans_D1_reg;
    reg signed [20:0] ans_D2_reg;
    reg signed [20:0] ans_D3_reg;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            ans_D1_reg <= 0;
            ans_D2_reg <= 0;
            ans_D3_reg <= 0;
        end
        // else if(cnt == 34 && in_vld) begin
        else if(cnt == 35 && in_vld) begin
            ans_D1_reg <= dot_D1;
            ans_D2_reg <= dot_D2;
            ans_D3_reg <= dot_D3;
        end
        // else if((cnt == 50 || cnt == 66) && in_vld) begin
        else if((cnt == 51 || cnt == 67) && in_vld) begin
            ans_D1_reg <= ans_D1_reg + dot_D1;
            ans_D2_reg <= ans_D2_reg + dot_D2;
            ans_D3_reg <= ans_D3_reg + dot_D3;
        end
    end

    assign sum_all = ans_D1_reg + ans_D2_reg + ans_D3_reg;


    // register
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            ans_reg <= 0;
        // else if(cnt == 67)
        else if(cnt == 69)
            ans_reg <= compress;
    end

endmodule
