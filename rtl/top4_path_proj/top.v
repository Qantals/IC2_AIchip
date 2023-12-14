`timescale 1ns/1ps
module top (
    input clk,
    input rst_n,
    input mode,
    input [7:0] din,
    input ram_en,

    output [7:0] dout,
    output out_data_flag
);

    wire weight_ram_en;
    wire data_ram_en;

    ram_mux u_ram_mux (
        .mode(mode),
        .ram_en(ram_en),
        .weight_ram_en(weight_ram_en),
        .data_ram_en(data_ram_en)
    );

    wire [19*8-1:0] data_mem;
    data_ram u_data_ram(
        .clk(clk),
        .wen(data_ram_en),
        .din(din),
        .dout(data_mem)
    );

    wire [3*3*3*2*8-1:0] weight_mem;
    weight_ram u_weight_ram(
        .clk(clk),
        .wen(weight_ram_en),
        .din(din),
        .dout(weight_mem)
    );

    // wire [$clog2(67)-1:0] cnt;
    wire [$clog2(69)-1:0] cnt;
    control u_control(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(data_ram_en),
        .cnt(cnt),
        .out_data_flag(out_data_flag)
    );

    wire in_vld;
    assign in_vld = (data_ram_en || cnt >= 64);

    wire [3*3*3*8-1:0] pool_lin;

    // dot module 
    wire [20:0] dot_D1;
    wire [20:0] dot_D2;
    wire [20:0] dot_D3;
    // 0->conv, 1->connect
    inner_dot_sel #(
        .SUM_WIDTH(21)
    ) u_inner_dot_sel_D1 (
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),

        .data0_sel0(data_mem[ 0*8 +: 8]),
        .data1_sel0(data_mem[ 1*8 +: 8]),
        .data2_sel0(data_mem[ 2*8 +: 8]),
        .data3_sel0(data_mem[ 8*8 +: 8]),
        .data4_sel0(data_mem[ 9*8 +: 8]),
        .data5_sel0(data_mem[10*8 +: 8]),
        .data6_sel0(data_mem[16*8 +: 8]),
        .data7_sel0(data_mem[17*8 +: 8]),
        .data8_sel0(data_mem[18*8 +: 8]),

        .data0_sel1(pool_lin[(0*9+0)*8 +: 8]),
        .data1_sel1(pool_lin[(0*9+1)*8 +: 8]),
        .data2_sel1(pool_lin[(0*9+2)*8 +: 8]),
        .data3_sel1(pool_lin[(0*9+3)*8 +: 8]),
        .data4_sel1(pool_lin[(0*9+4)*8 +: 8]),
        .data5_sel1(pool_lin[(0*9+5)*8 +: 8]),
        .data6_sel1(pool_lin[(0*9+6)*8 +: 8]),
        .data7_sel1(pool_lin[(0*9+7)*8 +: 8]),
        .data8_sel1(pool_lin[(0*9+8)*8 +: 8]),

        .weight0_sel0(weight_mem[(0*9+0)*8 +: 8]),
        .weight1_sel0(weight_mem[(0*9+1)*8 +: 8]),
        .weight2_sel0(weight_mem[(0*9+2)*8 +: 8]),
        .weight3_sel0(weight_mem[(0*9+3)*8 +: 8]),
        .weight4_sel0(weight_mem[(0*9+4)*8 +: 8]),
        .weight5_sel0(weight_mem[(0*9+5)*8 +: 8]),
        .weight6_sel0(weight_mem[(0*9+6)*8 +: 8]),
        .weight7_sel0(weight_mem[(0*9+7)*8 +: 8]),
        .weight8_sel0(weight_mem[(0*9+8)*8 +: 8]),

        .weight0_sel1(weight_mem[(27+0*9+0)*8 +: 8]),
        .weight1_sel1(weight_mem[(27+0*9+1)*8 +: 8]),
        .weight2_sel1(weight_mem[(27+0*9+2)*8 +: 8]),
        .weight3_sel1(weight_mem[(27+0*9+3)*8 +: 8]),
        .weight4_sel1(weight_mem[(27+0*9+4)*8 +: 8]),
        .weight5_sel1(weight_mem[(27+0*9+5)*8 +: 8]),
        .weight6_sel1(weight_mem[(27+0*9+6)*8 +: 8]),
        .weight7_sel1(weight_mem[(27+0*9+7)*8 +: 8]),
        .weight8_sel1(weight_mem[(27+0*9+8)*8 +: 8]),

        .dot(dot_D1)
    );
    inner_dot_sel #(
        .SUM_WIDTH(21)
    ) u_inner_dot_sel_D2 (
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),

        .data0_sel0(data_mem[ 0*8 +: 8]),
        .data1_sel0(data_mem[ 1*8 +: 8]),
        .data2_sel0(data_mem[ 2*8 +: 8]),
        .data3_sel0(data_mem[ 8*8 +: 8]),
        .data4_sel0(data_mem[ 9*8 +: 8]),
        .data5_sel0(data_mem[10*8 +: 8]),
        .data6_sel0(data_mem[16*8 +: 8]),
        .data7_sel0(data_mem[17*8 +: 8]),
        .data8_sel0(data_mem[18*8 +: 8]),

        .data0_sel1(pool_lin[(1*9+0)*8 +: 8]),
        .data1_sel1(pool_lin[(1*9+1)*8 +: 8]),
        .data2_sel1(pool_lin[(1*9+2)*8 +: 8]),
        .data3_sel1(pool_lin[(1*9+3)*8 +: 8]),
        .data4_sel1(pool_lin[(1*9+4)*8 +: 8]),
        .data5_sel1(pool_lin[(1*9+5)*8 +: 8]),
        .data6_sel1(pool_lin[(1*9+6)*8 +: 8]),
        .data7_sel1(pool_lin[(1*9+7)*8 +: 8]),
        .data8_sel1(pool_lin[(1*9+8)*8 +: 8]),

        .weight0_sel0(weight_mem[(1*9+0)*8 +: 8]),
        .weight1_sel0(weight_mem[(1*9+1)*8 +: 8]),
        .weight2_sel0(weight_mem[(1*9+2)*8 +: 8]),
        .weight3_sel0(weight_mem[(1*9+3)*8 +: 8]),
        .weight4_sel0(weight_mem[(1*9+4)*8 +: 8]),
        .weight5_sel0(weight_mem[(1*9+5)*8 +: 8]),
        .weight6_sel0(weight_mem[(1*9+6)*8 +: 8]),
        .weight7_sel0(weight_mem[(1*9+7)*8 +: 8]),
        .weight8_sel0(weight_mem[(1*9+8)*8 +: 8]),

        .weight0_sel1(weight_mem[(27+1*9+0)*8 +: 8]),
        .weight1_sel1(weight_mem[(27+1*9+1)*8 +: 8]),
        .weight2_sel1(weight_mem[(27+1*9+2)*8 +: 8]),
        .weight3_sel1(weight_mem[(27+1*9+3)*8 +: 8]),
        .weight4_sel1(weight_mem[(27+1*9+4)*8 +: 8]),
        .weight5_sel1(weight_mem[(27+1*9+5)*8 +: 8]),
        .weight6_sel1(weight_mem[(27+1*9+6)*8 +: 8]),
        .weight7_sel1(weight_mem[(27+1*9+7)*8 +: 8]),
        .weight8_sel1(weight_mem[(27+1*9+8)*8 +: 8]),

        .dot(dot_D2)
    );
    inner_dot_sel #(
        .SUM_WIDTH(21)
    ) u_inner_dot_sel_D3 (
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),

        .data0_sel0(data_mem[ 0*8 +: 8]),
        .data1_sel0(data_mem[ 1*8 +: 8]),
        .data2_sel0(data_mem[ 2*8 +: 8]),
        .data3_sel0(data_mem[ 8*8 +: 8]),
        .data4_sel0(data_mem[ 9*8 +: 8]),
        .data5_sel0(data_mem[10*8 +: 8]),
        .data6_sel0(data_mem[16*8 +: 8]),
        .data7_sel0(data_mem[17*8 +: 8]),
        .data8_sel0(data_mem[18*8 +: 8]),

        .data0_sel1(pool_lin[(2*9+0)*8 +: 8]),
        .data1_sel1(pool_lin[(2*9+1)*8 +: 8]),
        .data2_sel1(pool_lin[(2*9+2)*8 +: 8]),
        .data3_sel1(pool_lin[(2*9+3)*8 +: 8]),
        .data4_sel1(pool_lin[(2*9+4)*8 +: 8]),
        .data5_sel1(pool_lin[(2*9+5)*8 +: 8]),
        .data6_sel1(pool_lin[(2*9+6)*8 +: 8]),
        .data7_sel1(pool_lin[(2*9+7)*8 +: 8]),
        .data8_sel1(pool_lin[(2*9+8)*8 +: 8]),

        .weight0_sel0(weight_mem[(2*9+0)*8 +: 8]),
        .weight1_sel0(weight_mem[(2*9+1)*8 +: 8]),
        .weight2_sel0(weight_mem[(2*9+2)*8 +: 8]),
        .weight3_sel0(weight_mem[(2*9+3)*8 +: 8]),
        .weight4_sel0(weight_mem[(2*9+4)*8 +: 8]),
        .weight5_sel0(weight_mem[(2*9+5)*8 +: 8]),
        .weight6_sel0(weight_mem[(2*9+6)*8 +: 8]),
        .weight7_sel0(weight_mem[(2*9+7)*8 +: 8]),
        .weight8_sel0(weight_mem[(2*9+8)*8 +: 8]),

        .weight0_sel1(weight_mem[(27+2*9+0)*8 +: 8]),
        .weight1_sel1(weight_mem[(27+2*9+1)*8 +: 8]),
        .weight2_sel1(weight_mem[(27+2*9+2)*8 +: 8]),
        .weight3_sel1(weight_mem[(27+2*9+3)*8 +: 8]),
        .weight4_sel1(weight_mem[(27+2*9+4)*8 +: 8]),
        .weight5_sel1(weight_mem[(27+2*9+5)*8 +: 8]),
        .weight6_sel1(weight_mem[(27+2*9+6)*8 +: 8]),
        .weight7_sel1(weight_mem[(27+2*9+7)*8 +: 8]),
        .weight8_sel1(weight_mem[(27+2*9+8)*8 +: 8]),

        .dot(dot_D3)
    );

    wire [20:0] sum_accum_D1;
    wire [20:0] sum_all;
    // assign sum_accum_D1 = (cnt == 67) ? (sum_all) : dot_D1;
    assign sum_accum_D1 = (cnt == 69) ? (sum_all) : dot_D1;

    wire [7:0] compress_D1;
    wire [7:0] compress_D2;
    wire [7:0] compress_D3;
    compress_utility #(
        .SUM_WIDTH(21)
    ) u_conv_3x3_compress_D1(
        .sum_accum(sum_accum_D1),
        .ans(compress_D1)
    );
    compress_utility #(
        .SUM_WIDTH(21)
    ) u_conv_3x3_compress_D2(
        .sum_accum(dot_D2),
        .ans(compress_D2)
    );
    compress_utility #(
        .SUM_WIDTH(21)
    ) u_conv_3x3_compress_D3(
        .sum_accum(dot_D3),
        .ans(compress_D3)
    );




    wire [7:0] conv_D1;
    wire [7:0] conv_D2;
    wire [7:0] conv_D3;
    conv_storage u_conv_storage(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),
        .ans_D1(compress_D1),
        .ans_D2(compress_D2),
        .ans_D3(compress_D3),
        .conv_D1_reg(conv_D1),
        .conv_D2_reg(conv_D2),
        .conv_D3_reg(conv_D3)
    );

    pool_module u_pool_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .cnt(cnt),
        .conv_D1(conv_D1),
        .conv_D2(conv_D2),
        .conv_D3(conv_D3),
        .pool_lin(pool_lin)
    );


    connect_module u_connect_module(
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt),
        .dot_D1(dot_D1),
        .dot_D2(dot_D2),
        .dot_D3(dot_D3),
        .sum_all(sum_all),
        .compress(compress_D1),
        .ans_reg(dout)
    );


endmodule
