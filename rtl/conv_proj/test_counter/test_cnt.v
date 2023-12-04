`timescale 1ns/1ps
module test_cnt(
    input clk,
    input rst_n,
    input in_valid,
    output reg out_valid
);
    reg [3:0] cnt;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            cnt <= 0;
        else if(in_valid) begin
            if(cnt < 8)  // count 9 times(0 ~ 8)
                cnt <= cnt + 1;
            else
                cnt <= 0;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_valid <= 0;
        else if(cnt == 7)
            out_valid <= 1;
        else
            out_valid <= 0;
    end


endmodule
