`timescale 1ns/1ps
module out_vld_utility (
    input clk,
    input rst_n,
    input out_vld,
    output reg out_vld_reg
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_vld_reg <= 0;
        else
            out_vld_reg <= out_vld;
    end

endmodule
