`timescale 1ns/1ps
module connect_storage (
    input clk,
    input rst_n,
    input in_vld,
    input [7:0] ans,
    output reg [7:0] ans_reg
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            ans_reg <= 0;
        else if(in_vld)
            ans_reg <= ans;
    end

endmodule
