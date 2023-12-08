`timescale 1ns/1ps
module pool_rc_cnt (
    input clk,
    input rst_n,
    input in_vld,
    
    output reg [1:0] r_cnt,
    output reg [1:0] c_cnt,
    output out_vld
);

    reg out_vld_reg;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            r_cnt <= 0;
            c_cnt <= 0;
        end
        else if(in_vld) begin
            if(c_cnt == 2) begin
                c_cnt <= 0;
                if(r_cnt == 2)
                    r_cnt <= 0;
                else
                    r_cnt <= r_cnt + 1;
            end
            else
                c_cnt <= c_cnt + 1;
        end
        else begin
            r_cnt <= 0;
            c_cnt <= 0;
        end
    end
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_vld_reg <= 0;
        else begin
            if(in_vld && r_cnt == 2 && c_cnt == 2)
                out_vld_reg <= 1;
            else if(in_vld)
                out_vld_reg <= 0;
        end
    end

    assign out_vld = out_vld_reg;


endmodule
