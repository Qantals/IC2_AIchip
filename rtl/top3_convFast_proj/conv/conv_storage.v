`timescale 1ns/1ps
// `define CONV_STORAGE_NORMAL
module conv_storage(
    input clk,
    input rst_n,
    input in_vld,
    input [5:0] cnt,
    input [7:0] ans_3x3_D1,
    input [7:0] ans_3x3_D2,
    input [7:0] ans_3x3_D3,

    output reg [6*6*3*8-1:0] conv_lin
);

    `ifdef CONV_STORAGE_NORMAL
    // storage normal
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            conv_lin <= 0;
        else if(in_vld) begin
            conv_lin[(0*6*6+cnt)*8 +: 8] <= ans_3x3_D1;
            conv_lin[(1*6*6+cnt)*8 +: 8] <= ans_3x3_D2;
            conv_lin[(2*6*6+cnt)*8 +: 8] <= ans_3x3_D3;
        end
    end

    `else
    // storage combinational logic
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            conv_lin <= 0;
        else if(in_vld) begin
            case (cnt)
                6'd0: begin
                    conv_lin[(0*6*6+0*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd1: begin
                    conv_lin[(0*6*6+0*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd2: begin
                    conv_lin[(0*6*6+0*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd3: begin
                    conv_lin[(0*6*6+0*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd4: begin
                    conv_lin[(0*6*6+0*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd5: begin
                    conv_lin[(0*6*6+0*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+0*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+0*6+5)*8 +: 8] <= ans_3x3_D3;
                end



                6'd6: begin
                    conv_lin[(0*6*6+1*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd7: begin
                    conv_lin[(0*6*6+1*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd8: begin
                    conv_lin[(0*6*6+1*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd9: begin
                    conv_lin[(0*6*6+1*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd10: begin
                    conv_lin[(0*6*6+1*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd11: begin
                    conv_lin[(0*6*6+1*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+1*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+1*6+5)*8 +: 8] <= ans_3x3_D3;
                end



                6'd12: begin
                    conv_lin[(0*6*6+2*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd13: begin
                    conv_lin[(0*6*6+2*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd14: begin
                    conv_lin[(0*6*6+2*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd15: begin
                    conv_lin[(0*6*6+2*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd16: begin
                    conv_lin[(0*6*6+2*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd17: begin
                    conv_lin[(0*6*6+2*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+2*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+2*6+5)*8 +: 8] <= ans_3x3_D3;
                end



                6'd18: begin
                    conv_lin[(0*6*6+3*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd19: begin
                    conv_lin[(0*6*6+3*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd20: begin
                    conv_lin[(0*6*6+3*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd21: begin
                    conv_lin[(0*6*6+3*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd22: begin
                    conv_lin[(0*6*6+3*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd23: begin
                    conv_lin[(0*6*6+3*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+3*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+3*6+5)*8 +: 8] <= ans_3x3_D3;
                end



                6'd24: begin
                    conv_lin[(0*6*6+4*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd25: begin
                    conv_lin[(0*6*6+4*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd26: begin
                    conv_lin[(0*6*6+4*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd27: begin
                    conv_lin[(0*6*6+4*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd28: begin
                    conv_lin[(0*6*6+4*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd29: begin
                    conv_lin[(0*6*6+4*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+4*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+4*6+5)*8 +: 8] <= ans_3x3_D3;
                end



                6'd30: begin
                    conv_lin[(0*6*6+5*6+0)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+0)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+0)*8 +: 8] <= ans_3x3_D3;
                end
                6'd31: begin
                    conv_lin[(0*6*6+5*6+1)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+1)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+1)*8 +: 8] <= ans_3x3_D3;
                end
                6'd32: begin
                    conv_lin[(0*6*6+5*6+2)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+2)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+2)*8 +: 8] <= ans_3x3_D3;
                end
                6'd33: begin
                    conv_lin[(0*6*6+5*6+3)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+3)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+3)*8 +: 8] <= ans_3x3_D3;
                end
                6'd34: begin
                    conv_lin[(0*6*6+5*6+4)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+4)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+4)*8 +: 8] <= ans_3x3_D3;
                end
                6'd35: begin
                    conv_lin[(0*6*6+5*6+5)*8 +: 8] <= ans_3x3_D1;
                    conv_lin[(1*6*6+5*6+5)*8 +: 8] <= ans_3x3_D2;
                    conv_lin[(2*6*6+5*6+5)*8 +: 8] <= ans_3x3_D3;
                end
                default: conv_lin <= conv_lin;
            endcase
        end
    end

    `endif


endmodule

