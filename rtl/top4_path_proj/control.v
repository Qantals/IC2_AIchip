`timescale 1ns/1ps
module control (
    input clk,
    input rst_n,
    input in_vld,

    // output reg [$clog2(67)-1:0] cnt,
    output reg [$clog2(69)-1:0] cnt,
    output reg out_data_flag
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            cnt <= 0;
        else if(in_vld) begin
            // if(cnt == 67)
            if(cnt == 69)
                // cnt <= 4;
                cnt <= 6;
            else
                cnt <= cnt + 1;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_data_flag <= 0;
        // else if(cnt == 67)
        else if(cnt == 69)
            out_data_flag <= 1;
        else
            out_data_flag <= 0;
    end

endmodule
