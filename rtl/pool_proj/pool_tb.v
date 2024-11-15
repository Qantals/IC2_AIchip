`timescale 1ns/1ps
module pool_tb;

    reg clk;
    reg rst_n;
    reg in_vld;
    reg [6*6*3*8-1:0] conv_lin;
    wire [3*3*3*8-1:0] pool_lin;
    wire out_vld;

    pool_module u_pool_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .conv_lin(conv_lin),
        .pool_lin(pool_lin),
        .out_vld(out_vld)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [7:0] conv_mem [6*6*3*100-1:0];
    reg [7:0] pool_mem [3*3*3*100-1:0];
    reg fail_sign;
    integer i_c,i_p;
    integer i_pic;

    initial begin
        fail_sign = 0;
        $readmemb("../sample_100/conv.txt",conv_mem);
        $readmemb("../sample_100/pool.txt",pool_mem);
        rst_n = 0;
        in_vld = 0;
        #6;
        rst_n = 1;
        // get started
        for(i_pic = 0; i_pic <= 100-1; i_pic = i_pic + 1) begin
            
            for(i_c = 0; i_c <= 6*6*3-1; i_c = i_c + 1) begin
                conv_lin[i_c*8 +: 8] = conv_mem[i_pic*6*6*3+i_c];
            end
            in_vld = 1;
            // wait for calculation
            @(posedge out_vld);
            #1;
            for(i_p = 0; i_p <= 3*3*3-1; i_p = i_p + 1) begin
                if(pool_mem[i_pic*3*3*3+i_p] != pool_lin[i_p*8 +: 8]) begin
                    $display("%0d:check fail: No.%0d:pool_lin=%0d,standard=%0d",i_pic,i_p,pool_lin[i_p*8 +: 8],pool_mem[i_pic*3*3*3+i_p]);
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
