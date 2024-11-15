`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    input [6*6*3*8-1:0] conv_lin,

    output reg [3*3*3*8-1:0] pool_lin,
    output out_vld
);



    reg [1:0] r_cnt,c_cnt; // max=2
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



    wire [7:0] ans_2x2_D1;
    wire [7:0] ans_2x2_D2;
    wire [7:0] ans_2x2_D3;
    pool2x2 u_pool2x2_D1(
        .conv0(conv_lin[(0*6*6+(r_cnt*6+c_cnt)*2  )*8 +: 8]),
        .conv1(conv_lin[(0*6*6+(r_cnt*6+c_cnt)*2+1)*8 +: 8]),
        .conv2(conv_lin[(0*6*6+(r_cnt*6+c_cnt)*2+6)*8 +: 8]),
        .conv3(conv_lin[(0*6*6+(r_cnt*6+c_cnt)*2+7)*8 +: 8]),

        .max(ans_2x2_D1)
    );
    pool2x2 u_pool2x2_D2(
        .conv0(conv_lin[(1*6*6+(r_cnt*6+c_cnt)*2  )*8 +: 8]),
        .conv1(conv_lin[(1*6*6+(r_cnt*6+c_cnt)*2+1)*8 +: 8]),
        .conv2(conv_lin[(1*6*6+(r_cnt*6+c_cnt)*2+6)*8 +: 8]),
        .conv3(conv_lin[(1*6*6+(r_cnt*6+c_cnt)*2+7)*8 +: 8]),

        .max(ans_2x2_D2)
    );
    pool2x2 u_pool2x2_D3(
        .conv0(conv_lin[(2*6*6+(r_cnt*6+c_cnt)*2  )*8 +: 8]),
        .conv1(conv_lin[(2*6*6+(r_cnt*6+c_cnt)*2+1)*8 +: 8]),
        .conv2(conv_lin[(2*6*6+(r_cnt*6+c_cnt)*2+6)*8 +: 8]),
        .conv3(conv_lin[(2*6*6+(r_cnt*6+c_cnt)*2+7)*8 +: 8]),

        .max(ans_2x2_D3)
    );

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            pool_lin <= 0;
        else if(in_vld) begin
            pool_lin[(0*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D1;
            pool_lin[(1*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D2;
            pool_lin[(2*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D3;
        end
    end


endmodule
