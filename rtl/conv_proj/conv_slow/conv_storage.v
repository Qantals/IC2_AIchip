`timescale 1ns/1ps
module conv_storage(
    input clk,
    input rst_n,
    input out_vld_3x3,
    input [2:0] r_cnt,
    input [2:0] c_cnt,
    input [7:0] ans_3x3_D1,
    input [7:0] ans_3x3_D2,
    input [7:0] ans_3x3_D3,

    output reg [6*6*3*8-1:0] conv_lin
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            conv_lin <= 0;
        else if(out_vld_3x3) begin
            conv_lin[(0*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D1;
            conv_lin[(1*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D2;
            conv_lin[(2*6*6+r_cnt*6+c_cnt)*8 +: 8] <= ans_3x3_D3;
        end
    end


endmodule






// `timescale 1ns/1ps
// module conv_storage(
//     input clk,
//     input rst_n,
//     input out_vld_3x3,
//     input [2:0] r_cnt,
//     input [2:0] c_cnt,
//     input [7:0] ans_3x3_D1,
//     input [7:0] ans_3x3_D2,
//     input [7:0] ans_3x3_D3,

//     output reg [6*6*3*8-1:0] conv_lin
// );

//     always @(posedge clk, negedge rst_n) begin
//         if(~rst_n)
//             conv_lin <= 0;
//         else if(out_vld_3x3) begin
//             case ({r_cnt,c_cnt})
//                 {3'd0,3'd0}: begin
//                     conv_lin[(0*6*6+0*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd0,3'd1}: begin
//                     conv_lin[(0*6*6+0*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd0,3'd2}: begin
//                     conv_lin[(0*6*6+0*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd0,3'd3}: begin
//                     conv_lin[(0*6*6+0*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd0,3'd4}: begin
//                     conv_lin[(0*6*6+0*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd0,3'd5}: begin
//                     conv_lin[(0*6*6+0*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+0*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+0*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end



//                 {3'd1,3'd0}: begin
//                     conv_lin[(0*6*6+1*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd1,3'd1}: begin
//                     conv_lin[(0*6*6+1*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd1,3'd2}: begin
//                     conv_lin[(0*6*6+1*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd1,3'd3}: begin
//                     conv_lin[(0*6*6+1*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd1,3'd4}: begin
//                     conv_lin[(0*6*6+1*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd1,3'd5}: begin
//                     conv_lin[(0*6*6+1*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+1*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+1*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end



//                 {3'd2,3'd0}: begin
//                     conv_lin[(0*6*6+2*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd2,3'd1}: begin
//                     conv_lin[(0*6*6+2*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd2,3'd2}: begin
//                     conv_lin[(0*6*6+2*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd2,3'd3}: begin
//                     conv_lin[(0*6*6+2*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd2,3'd4}: begin
//                     conv_lin[(0*6*6+2*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd2,3'd5}: begin
//                     conv_lin[(0*6*6+2*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+2*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+2*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end



//                 {3'd3,3'd0}: begin
//                     conv_lin[(0*6*6+3*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd3,3'd1}: begin
//                     conv_lin[(0*6*6+3*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd3,3'd2}: begin
//                     conv_lin[(0*6*6+3*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd3,3'd3}: begin
//                     conv_lin[(0*6*6+3*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd3,3'd4}: begin
//                     conv_lin[(0*6*6+3*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd3,3'd5}: begin
//                     conv_lin[(0*6*6+3*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+3*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+3*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end



//                 {3'd4,3'd0}: begin
//                     conv_lin[(0*6*6+4*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd4,3'd1}: begin
//                     conv_lin[(0*6*6+4*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd4,3'd2}: begin
//                     conv_lin[(0*6*6+4*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd4,3'd3}: begin
//                     conv_lin[(0*6*6+4*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd4,3'd4}: begin
//                     conv_lin[(0*6*6+4*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd4,3'd5}: begin
//                     conv_lin[(0*6*6+4*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+4*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+4*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end



//                 {3'd5,3'd0}: begin
//                     conv_lin[(0*6*6+5*6+0)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+0)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+0)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd5,3'd1}: begin
//                     conv_lin[(0*6*6+5*6+1)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+1)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+1)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd5,3'd2}: begin
//                     conv_lin[(0*6*6+5*6+2)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+2)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+2)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd5,3'd3}: begin
//                     conv_lin[(0*6*6+5*6+3)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+3)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+3)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd5,3'd4}: begin
//                     conv_lin[(0*6*6+5*6+4)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+4)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+4)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 {3'd5,3'd5}: begin
//                     conv_lin[(0*6*6+5*6+5)*8 +: 8] <= ans_3x3_D1;
//                     conv_lin[(1*6*6+5*6+5)*8 +: 8] <= ans_3x3_D2;
//                     conv_lin[(2*6*6+5*6+5)*8 +: 8] <= ans_3x3_D3;
//                 end
//                 // default: 
//             endcase
//         end
//     end

// endmodule
