`timescale 1ns/1ps
module conv_tb;

    // reg clk;
    // reg rst_n;
    reg [3*3*3*8-1:0] pool_lin;
    reg [3*3*3*8-1:0] weight_lin;
    wire [7:0] ans;

    connect_module u_connect_module(
        // .clk(clk),
        // .rst_n(rst_n),
        .pool_lin(pool_lin),
        .weight_lin(weight_lin),
        .ans(ans)
    );

    // initial begin
    //     clk = 0;
    //     forever #5 clk = ~clk;
    // end

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
        for(i_pic = 0; i_pic <= 100-1; i_pic = i_pic + 1) begin
            // rst_n = 0;
            for(i_p = 0; i_p <= 3*3*3-1; i_p = i_p + 1) begin
                pool_lin[i_p*8 +: 8] = pool_mem[i_pic*3*3*3+i_p];
            end
            // #6;
            // rst_n = 1;
            #100;   // depend on your logic delay
            if(ans_mem[i_pic] != ans) begin
                $display("%0d:check fail: ans=%0d,standard=%0d",i_pic,ans,ans_mem[i_pic]);
                fail_sign = 1;
            end
            // @(negedge clk);
            // #50;
        end
        if(fail_sign == 0)
            $display("check OK.");
        $finish;
    end


endmodule
