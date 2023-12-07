`timescale 1ns/1ps
module conv_tb;

    reg clk;
    reg rst_n;
    reg in_vld;
    reg [8*8*1*8-1:0] data_lin;
    reg [3*3*3*8-1:0] weight_lin;
    wire [6*6*3*8-1:0] conv_lin;
    wire out_vld;

    conv_module u_conv_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .data_lin(data_lin),
        .weight_lin(weight_lin),
        .conv_lin(conv_lin),
        .out_vld(out_vld)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [7:0] data_mem [8*8*1*100-1:0];
    reg [7:0] weight_mem [3*3*3-1:0];
    reg [7:0] conv_mem [6*6*3*100-1:0];
    reg fail_sign;
    integer i_d,i_w,i_c;
    integer i_pic;

    initial begin
        fail_sign = 0;
        $readmemb("../sample_100/data.txt",data_mem);
        $readmemb("../sample_100/weight.txt",weight_mem);
        $readmemb("../sample_100/conv.txt",conv_mem);
        for(i_w = 0; i_w <= 3*3*3-1; i_w = i_w + 1) begin
            weight_lin[i_w*8 +: 8] = weight_mem[i_w];
        end
        rst_n = 0;
        in_vld = 0;
        #6;
        rst_n = 1;
        // get started
        for(i_pic = 0; i_pic <= 100-1; i_pic = i_pic + 1) begin

            for(i_d = 0; i_d <= 8*8*1-1; i_d = i_d + 1) begin
                data_lin[i_d*8 +: 8] = data_mem[i_pic*8*8+i_d];
            end
            in_vld = 1;
            // wait for calculation
            @(posedge out_vld);
            #1;
            for(i_c = 0; i_c <= 6*6*3-1; i_c = i_c + 1) begin
                if(conv_mem[i_pic*6*6*3+i_c] != conv_lin[i_c*8 +: 8]) begin
                    $display("%0d:check fail: No.%0d:conv_lin=%0d,standard=%0d",i_pic,i_c,conv_lin[i_c*8 +: 8],conv_mem[i_pic*6*6*3+i_c]);
                    fail_sign = 1;
                end
            end
            in_vld = 0;
            @(posedge clk);
            @(posedge clk);
            #1;
        end
        if(fail_sign == 0)
            $display("check OK.");
        $finish;
    end


endmodule
