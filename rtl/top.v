`timescale 1ns/1ps
module top (
    input clk,
    input rst_n,
    input mode,
    input [7:0] din,
    input ram_en,   // wait to realize
    output [7:0] dout,
    output out_data_flag    // wait to realize
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

    wire [6*6*3*8-1:0] conv_lin;
    conv_module u_conv_module(
        // .clk(clk),
        // .rst_n(rst_n),
        .data_lin(data_mem),
        .weight_lin(weight_mem[3*3*3*1*8-1:0]),
        .conv_lin(conv_lin)
    );

    wire [3*3*3*8-1:0] pool_lin;
    pool_module u_pool_module(
        // .clk(clk),
        // .rst_n(rst_n),
        .conv_lin(conv_lin),
        .pool_lin(pool_lin)
    );


    connect_module u_connect_module(
        // .clk(clk),
        // .rst_n(rst_n),
        .pool_lin(pool_lin),
        .weight_lin(weight_mem[(3*3*3*2*8-1):(3*3*3*1*8)]),
        .ans(dout)
    );

    assign out_data_flag = (dout != 0);

endmodule
