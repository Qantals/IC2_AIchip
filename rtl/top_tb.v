`timescale 1ps/1ps
module top_tb;
    reg clk;
    reg rst_n;
    reg mode;
    reg [7:0] din;
    reg ram_en;

    wire [7:0] dout;
    wire out_data_flag;

    top u_top(
        .clk(clk),
        .rst_n(rst_n),
        .mode(mode),
        .din(din),
        .ram_en(ram_en),

        .dout(dout),
        .out_data_flag(out_data_flag)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [7:0] data_mem [8*8*1*100-1:0];
    reg [7:0] weight_mem [3*3*3*2-1:0];
    reg [7:0] output_mem [100-1:0];
    integer index_data,index_weight;
    integer i;
    initial begin
        $readmemb("../sample_100/data.txt",data_mem);
        $readmemb("../sample_100/weight.txt",weight_mem);
        $readmemb("../sample_100/output.txt",output_mem);
    end

    initial begin
        i = 0;
        while (i <= 99) begin
            rst_n = 0;
            mode = 0;
            din = 0;
            ram_en = 0;
            #6 rst_n = 1;
            ram_en = 1;
            for(index_data = 0; index_data <= 63; index_data = index_data + 1) begin
                din = data_mem[index_data+i*64];
                @(posedge clk);
                #1;
            end
            mode = 1;
            for(index_weight = 0; index_weight <= 53; index_weight = index_weight + 1) begin
                din = weight_mem[index_weight];
                @(posedge clk);
                #1;
            end
            ram_en = 0;
            #1200;
            if($signed(output_mem[i]) == $signed(dout))
                $display("%0d:check OK,dout=%0d",i,$signed(dout));
            else
                $display("%0d:check fail,dout=%0d,standard=%0d",i,$signed(dout),$signed(output_mem[i]));
            @(negedge clk);
            i = i + 1;
        end
    end


endmodule
