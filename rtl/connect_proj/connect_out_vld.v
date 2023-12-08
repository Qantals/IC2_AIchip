`timescale 1ns/1ps
module connect_out_vld (
    input clk,
    input rst_n,
    input in_vld,
    input out_vld_3x3,
    output reg out_vld
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_vld <= 0;
        else begin
            if(in_vld && out_vld_3x3)
                out_vld <= 1;
            else if(in_vld)
                out_vld <= 0;
        end
    end


endmodule
