`timescale 1ns/1ps
module conv3x3_cnt #(
    parameter CNT_MAX = 9
)(
    input clk,
    input rst_n,
    input in_vld,
    output reg [3:0] cnt,
    output out_vld
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

    assign out_vld = (cnt == CNT_MAX);


endmodule
