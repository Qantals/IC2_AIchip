`timescale 1ns/1ps
module connect_module (
    input clk,
    input rst_n,
    input in_vld,
    input [3*3*3*8-1:0] pool_lin,
    input [3*3*3*8-1:0] weight_lin,

    output reg signed [7:0] ans_reg,
    output reg out_vld
);

    wire [3:0] cnt_3x3;
    wire signed [20:0] ans_3x3_D1;
    wire signed [20:0] ans_3x3_D2;
    wire signed [20:0] ans_3x3_D3;
    connect3x3 u_connect3x3_D1(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(pool_lin[(0*9  )*8 +: 8]),
        .data1(pool_lin[(0*9+1)*8 +: 8]),
        .data2(pool_lin[(0*9+2)*8 +: 8]),
        .data3(pool_lin[(0*9+3)*8 +: 8]),
        .data4(pool_lin[(0*9+4)*8 +: 8]),
        .data5(pool_lin[(0*9+5)*8 +: 8]),
        .data6(pool_lin[(0*9+6)*8 +: 8]),
        .data7(pool_lin[(0*9+7)*8 +: 8]),
        .data8(pool_lin[(0*9+8)*8 +: 8]),

        .weight0(weight_lin[(0*9  )*8 +: 8]),
        .weight1(weight_lin[(0*9+1)*8 +: 8]),
        .weight2(weight_lin[(0*9+2)*8 +: 8]),
        .weight3(weight_lin[(0*9+3)*8 +: 8]),
        .weight4(weight_lin[(0*9+4)*8 +: 8]),
        .weight5(weight_lin[(0*9+5)*8 +: 8]),
        .weight6(weight_lin[(0*9+6)*8 +: 8]),
        .weight7(weight_lin[(0*9+7)*8 +: 8]),
        .weight8(weight_lin[(0*9+8)*8 +: 8]),

        .ans(ans_3x3_D1)
    );
    connect3x3 u_connect3x3_D2(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(pool_lin[(1*9  )*8 +: 8]),
        .data1(pool_lin[(1*9+1)*8 +: 8]),
        .data2(pool_lin[(1*9+2)*8 +: 8]),
        .data3(pool_lin[(1*9+3)*8 +: 8]),
        .data4(pool_lin[(1*9+4)*8 +: 8]),
        .data5(pool_lin[(1*9+5)*8 +: 8]),
        .data6(pool_lin[(1*9+6)*8 +: 8]),
        .data7(pool_lin[(1*9+7)*8 +: 8]),
        .data8(pool_lin[(1*9+8)*8 +: 8]),

        .weight0(weight_lin[(1*9  )*8 +: 8]),
        .weight1(weight_lin[(1*9+1)*8 +: 8]),
        .weight2(weight_lin[(1*9+2)*8 +: 8]),
        .weight3(weight_lin[(1*9+3)*8 +: 8]),
        .weight4(weight_lin[(1*9+4)*8 +: 8]),
        .weight5(weight_lin[(1*9+5)*8 +: 8]),
        .weight6(weight_lin[(1*9+6)*8 +: 8]),
        .weight7(weight_lin[(1*9+7)*8 +: 8]),
        .weight8(weight_lin[(1*9+8)*8 +: 8]),

        .ans(ans_3x3_D2)
    );
    connect3x3 u_connect3x3_D3(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(pool_lin[(2*9  )*8 +: 8]),
        .data1(pool_lin[(2*9+1)*8 +: 8]),
        .data2(pool_lin[(2*9+2)*8 +: 8]),
        .data3(pool_lin[(2*9+3)*8 +: 8]),
        .data4(pool_lin[(2*9+4)*8 +: 8]),
        .data5(pool_lin[(2*9+5)*8 +: 8]),
        .data6(pool_lin[(2*9+6)*8 +: 8]),
        .data7(pool_lin[(2*9+7)*8 +: 8]),
        .data8(pool_lin[(2*9+8)*8 +: 8]),

        .weight0(weight_lin[(2*9  )*8 +: 8]),
        .weight1(weight_lin[(2*9+1)*8 +: 8]),
        .weight2(weight_lin[(2*9+2)*8 +: 8]),
        .weight3(weight_lin[(2*9+3)*8 +: 8]),
        .weight4(weight_lin[(2*9+4)*8 +: 8]),
        .weight5(weight_lin[(2*9+5)*8 +: 8]),
        .weight6(weight_lin[(2*9+6)*8 +: 8]),
        .weight7(weight_lin[(2*9+7)*8 +: 8]),
        .weight8(weight_lin[(2*9+8)*8 +: 8]),

        .ans(ans_3x3_D3)
    );

    wire out_vld_3x3;
    connect3x3_cnt u_connect3x3_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_3x3),
        .out_vld(out_vld_3x3)   // difference!
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

    wire signed [20:0] sum_all;
    assign sum_all = ans_3x3_D1 + ans_3x3_D2 + ans_3x3_D3;

    wire signed [7:0] ans;
    assign ans = ($signed(sum_all[20:8]) > 127) ? 8'd127 : (($signed(sum_all[20:8]) < -128) ? -8'd128 : $signed(sum_all[15:8]));
    
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            ans_reg <= 0;
        else if(out_vld_3x3)
            ans_reg <= ans;
    end


endmodule
