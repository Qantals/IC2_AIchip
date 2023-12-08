`timescale 1ns/1ps
module counter_utility #(
    parameter CNT_WIDTH = 4,
    parameter CNT_MAX = 9
)(
    input clk,
    input rst_n,
    input in_vld,
    output reg [CNT_WIDTH-1:0] cnt,
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
    end

    assign out_vld = (cnt == CNT_MAX);


endmodule
