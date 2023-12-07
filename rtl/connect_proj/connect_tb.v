`timescale 1ns/1ps
module connect_tb;

    reg clk;
    reg rst_n;
    reg in_vld;
    reg [3*3*3*8-1:0] pool_lin;
    reg [3*3*3*8-1:0] weight_lin;
    wire signed [7:0] ans_reg;
    wire out_vld;

    connect_module u_connect_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .pool_lin(pool_lin),
        .weight_lin(weight_lin),
        .ans_reg(ans_reg),
        .out_vld(out_vld)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [7:0] pool_mem [3*3*3*100-1:0];
    reg [7:0] weight_mem [3*3*3*2-1:0];
    reg [7:0] ans_mem [100-1:0];
    reg fail_sign;
    integer i_p,i_w,i_a;
    integer i_pic;

    initial begin
        fail_sign = 0;
        $readmemb("../sample_100/pool.txt",pool_mem);
        $readmemb("../sample_100/weight.txt",weight_mem);
        $readmemb("../sample_100/output.txt",ans_mem);
        for(i_w = 0; i_w <= 3*3*3-1; i_w = i_w + 1) begin
            weight_lin[i_w*8 +: 8] = weight_mem[i_w+3*3*3];
        end
        rst_n = 0;
        in_vld = 0;
        #6;
        rst_n = 1;
        // get started
        for(i_pic = 0; i_pic <= 100-1; i_pic = i_pic + 1) begin

            for(i_p = 0; i_p <= 3*3*3-1; i_p = i_p + 1) begin
                pool_lin[i_p*8 +: 8] = pool_mem[i_pic*3*3*3+i_p];
            end
            in_vld = 1;
            // wait for calculation
            @(posedge out_vld);
            #1;
            if(ans_mem[i_pic] != ans_reg) begin
                $display("%0d:check fail: ans=%0d,standard=%0d",i_pic,ans_reg,ans_mem[i_pic]);
                fail_sign = 1;
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
