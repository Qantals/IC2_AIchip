`timescale 1ns/1ps
module conv3x3_cnt #(
    parameter CNT_MAX = 9
)(
    input clk,
    input rst_n,
    input in_vld,
    output reg [3:0] cnt,
    output reg out_vld
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            cnt <= 0;
        else if(in_vld) begin
            if(cnt == CNT_MAX)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
        else
            cnt <= 0;
    end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_vld <= 0;
        else if(cnt == CNT_MAX - 1)
            out_vld <= 1;
        else
            out_vld <= 0;
    end


endmodule
