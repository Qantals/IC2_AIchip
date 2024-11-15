`timescale 1ns/1ps
module connect3x3_cnt #(
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
    end

    assign out_vld = (cnt == CNT_MAX);
    // always @(posedge clk, negedge rst_n) begin
    //     if(~rst_n)
    //         out_vld <= 0;
    //     else begin
    //         if(in_vld && cnt == CNT_MAX)
    //             out_vld <= 1;
    //         else if(in_vld)
    //             out_vld <= 0;
    //     end
    // end


endmodule
