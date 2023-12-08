`timescale 1ns/1ps
module connect_sum (
    input clk,
    input rst_n,
    input out_vld_3x3,
    input signed [20:0] ans_3x3_D1,
    input signed [20:0] ans_3x3_D2,
    input signed [20:0] ans_3x3_D3,
    output reg signed [7:0] ans_reg
);

    wire signed [20:0] sum_all;
    assign sum_all = ans_3x3_D1 + ans_3x3_D2 + ans_3x3_D3;

    wire signed [7:0] ans;
    assign ans = ($signed(sum_all[20:8]) > 127) ? 8'd127 : (($signed(sum_all[20:8]) < -128) ? -8'd128 : $signed(sum_all[15:8]));
    
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            ans_reg <= 0;
        else if(out_vld_3x3)
            ans_reg <= ans;
    end



endmodule
