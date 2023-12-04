`timescale 1ns/1ps
module conv_tb;

    // reg clk;
    // reg rst_n;
    reg [8*8*1*8-1:0] data_lin;
    reg [3*3*3*8-1:0] weight_lin;
    wire [6*6*3*8-1:0] conv_lin;

    conv_module u_conv_module(
        // .clk(clk),
        // .rst_n(rst_n),
        .data_lin(data_lin),
        .weight_lin(weight_lin),
        .conv_lin(conv_lin)
    );

    // initial begin
    //     clk = 0;
    //     forever #5 clk = ~clk;
    // end

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
        for(i_pic = 0; i_pic <= 100-1; i_pic = i_pic + 1) begin
            // rst_n = 0;
            for(i_d = 0; i_d <= 8*8*1-1; i_d = i_d + 1) begin
                data_lin[i_d*8 +: 8] = data_mem[i_pic*8*8+i_d];
            end
            // #6;
            // rst_n = 1;
            #100;   // depend on your logic delay
            for(i_c = 0; i_c <= 6*6*3-1; i_c = i_c + 1) begin
                if(conv_mem[i_pic*6*6*3+i_c] != conv_lin[i_c*8 +: 8]) begin
                    $display("%0d:check fail: No.%0d:conv_lin=%0d,standard=%0d",i_pic,i_c,conv_lin[i_c*8 +: 8],conv_mem[i_pic*6*6*3+i_c]);
                    fail_sign = 1;
                end
            end
            // @(negedge clk);
            // #50;
        end
        if(fail_sign == 0)
            $display("check OK.");
        $finish;
    end


endmodule
