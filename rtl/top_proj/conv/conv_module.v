`timescale 1ns/1ps
module conv_module (
    input clk,
    input rst_n,
    input in_vld,
    input [8*8*1*8-1:0] data_lin,
    input [3*3*3*8-1:0] weight_lin,

    output reg [6*6*3*8-1:0] conv_lin,
    output out_vld
);


    wire out_vld_3x3;
    reg [2:0] r_cnt,c_cnt; // max=6
    reg out_vld_reg;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            r_cnt <= 0;
            c_cnt <= 0;
        end
        else if(in_vld) begin
            if(out_vld_3x3 == 1)begin
                if(c_cnt == 5) begin
                    c_cnt <= 0;
                    if(r_cnt == 5)
                        r_cnt <= 0;
                    else
                        r_cnt <= r_cnt + 1;
                end
                else
                    c_cnt <= c_cnt + 1;
            end
            // else hold
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
            if(in_vld && r_cnt == 5 && c_cnt == 5 && out_vld_3x3 == 1)
                out_vld_reg <= 1;
            else if(in_vld)
                out_vld_reg <= 0;
        end
    end

    assign out_vld = out_vld_reg;


    wire [3:0] cnt_3x3;
    wire [7:0] ans_3x3_D1;
    wire [7:0] ans_3x3_D2;
    wire [7:0] ans_3x3_D3;

    wire [7:0] data0,data1,data2,data3,data4,data5,data6,data7,data8;
    conv_mux u_conv_mux(
        .r_cnt(r_cnt),
        .c_cnt(c_cnt),
        .data_lin(data_lin),

        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8)
    );


    conv3x3 u_conv3x3_D1(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),

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
    conv3x3 u_conv3x3_D2(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),

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
    conv3x3 u_conv3x3_D3(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt_3x3),

        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),

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

    conv3x3_cnt u_conv3x3_cnt(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt_3x3),
        .out_vld(out_vld_3x3)
    );

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            conv_lin <= 0;
        else if(out_vld_3x3) begin
            conv_lin[(0*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D1;
            conv_lin[(1*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D2;
            conv_lin[(2*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D3;
        end
    end





endmodule
