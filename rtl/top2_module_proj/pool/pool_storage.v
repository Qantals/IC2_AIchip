`timescale 1ns/1ps
`define POOL_STORAGE_NORMAL
module pool_storage(
    input clk,
    input rst_n,
    input in_vld,
    input [3:0] cnt,
    input [7:0] ans_2x2_D1,
    input [7:0] ans_2x2_D2,
    input [7:0] ans_2x2_D3,

    output reg [3*3*3*8-1:0] pool_lin
);

    `ifdef POOL_STORAGE_NORMAL
    // storage normal
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            pool_lin <= 0;
        else if(in_vld) begin
            pool_lin[(0*3*3+cnt)*8 +: 8] <= ans_2x2_D1;
            pool_lin[(1*3*3+cnt)*8 +: 8] <= ans_2x2_D2;
            pool_lin[(2*3*3+cnt)*8 +: 8] <= ans_2x2_D3;
        end
    end

    `else
    // storage combinational logic
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            pool_lin <= 0;
        else if(in_vld) begin
            case (cnt)
                4'd0: begin
                    pool_lin[(0*3*3+0*3+0)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+0*3+0)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+0*3+0)*8 +: 8] <= ans_2x2_D3;
                end
                4'd1: begin
                    pool_lin[(0*3*3+0*3+1)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+0*3+1)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+0*3+1)*8 +: 8] <= ans_2x2_D3;
                end
                4'd2: begin
                    pool_lin[(0*3*3+0*3+2)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+0*3+2)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+0*3+2)*8 +: 8] <= ans_2x2_D3;
                end



                4'd3: begin
                    pool_lin[(0*3*3+1*3+0)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+1*3+0)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+1*3+0)*8 +: 8] <= ans_2x2_D3;
                end
                4'd4: begin
                    pool_lin[(0*3*3+1*3+1)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+1*3+1)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+1*3+1)*8 +: 8] <= ans_2x2_D3;
                end
                4'd5: begin
                    pool_lin[(0*3*3+1*3+2)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+1*3+2)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+1*3+2)*8 +: 8] <= ans_2x2_D3;
                end



                4'd6: begin
                    pool_lin[(0*3*3+2*3+0)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+2*3+0)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+2*3+0)*8 +: 8] <= ans_2x2_D3;
                end
                4'd7: begin
                    pool_lin[(0*3*3+2*3+1)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+2*3+1)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+2*3+1)*8 +: 8] <= ans_2x2_D3;
                end
                4'd8: begin
                    pool_lin[(0*3*3+2*3+2)*8 +: 8] <= ans_2x2_D1;
                    pool_lin[(1*3*3+2*3+2)*8 +: 8] <= ans_2x2_D2;
                    pool_lin[(2*3*3+2*3+2)*8 +: 8] <= ans_2x2_D3;
                end
                default: pool_lin <= 0;
            endcase
        end
    end

    `endif

endmodule
