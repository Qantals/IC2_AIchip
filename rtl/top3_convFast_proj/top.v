`timescale 1ns/1ps
module top (
    input clk,
    input rst_n,
    input mode,
    input [7:0] din,
    input ram_en,
    input calc_en,

    output [7:0] dout,
    output out_data_flag
);

    wire [$clog2(8*8*1)-1:0] data_ram_waddr;
    wire [$clog2(3*3*3*2)-1:0] weight_ram_waddr;

    wire weight_ram_en;
    wire data_ram_en;

    ram_mux #(
        .MODE_DATA(0),
        .MODE_WEIGHT(1)
    ) u_ram_mux (
        .clk(clk),
        .rst_n(rst_n),
        .mode(mode),
        .ram_en(ram_en),

        .data_ram_waddr(data_ram_waddr),
        .weight_ram_waddr(weight_ram_waddr),

        .weight_ram_en(weight_ram_en),
        .data_ram_en(data_ram_en)
    );

    wire [8*8*1*8-1:0] data_mem;
    data_ram u_data_ram(
        .clk(clk),
        .wen(data_ram_en),
        .waddr(data_ram_waddr),
        .din(din),
        .dout(data_mem)
    );

    wire [3*3*3*2*8-1:0] weight_mem;
    weight_ram u_weight_ram(
        .clk(clk),
        .wen(weight_ram_en),
        .waddr(weight_ram_waddr),
        .din(din),
        .dout(weight_mem)
    );

    wire conv_fin,pool_fin,connect_fin;
    wire conv_en,pool_en,connect_en;
    control u_control(
        .clk(clk),
        .rst_n(rst_n),
        .calc_en(calc_en),

        .conv_fin(conv_fin),
        .pool_fin(pool_fin),
        .connect_fin(connect_fin),

        .conv_en(conv_en),
        .pool_en(pool_en),
        .connect_en(connect_en),
        .out_data_flag(out_data_flag)
    );


    wire [6*6*3*8-1:0] conv_lin;
    conv_module u_conv_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(conv_en),
        .data_lin(data_mem),
        .weight_lin(weight_mem[3*3*3*1*8-1:0]),
        .conv_lin(conv_lin),
        .out_vld(conv_fin)
    );

    wire [3*3*3*8-1:0] pool_lin;
    pool_module u_pool_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(pool_en),
        .conv_lin(conv_lin),
        .pool_lin(pool_lin),
        .out_vld(pool_fin)
    );


    connect_module u_connect_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(connect_en),
        .pool_lin(pool_lin),
        .weight_lin(weight_mem[(3*3*3*2*8-1):(3*3*3*1*8)]),
        .ans_reg(dout),
        .out_vld(connect_fin)
    );


endmodule
