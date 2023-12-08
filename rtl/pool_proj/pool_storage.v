`timescale 1ns/1ps
module pool_storage(
    input clk,
    input rst_n,
    input in_vld,
    input [1:0] r_cnt,
    input [1:0] c_cnt,
    input [7:0] ans_2x2_D1,
    input [7:0] ans_2x2_D2,
    input [7:0] ans_2x2_D3,

    output reg [3*3*3*8-1:0] pool_lin
);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            pool_lin <= 0;
        else if(in_vld) begin
            pool_lin[(0*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D1;
            pool_lin[(1*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D2;
            pool_lin[(2*3*3+r_cnt*3+c_cnt)*8 +: 8] <= ans_2x2_D3;
        end
    end


endmodule






// `timescale 1ns/1ps
// module pool_storage(
//     input clk,
//     input rst_n,
//     input in_vld,
//     input [1:0] r_cnt,
//     input [1:0] c_cnt,
//     input [7:0] ans_2x2_D1,
//     input [7:0] ans_2x2_D2,
//     input [7:0] ans_2x2_D3,

//     output reg [3*3*3*8-1:0] pool_lin
// );

//     always @(posedge clk, negedge rst_n) begin
//         if(~rst_n)
//             pool_lin <= 0;
//         else if(in_vld) begin
//             case ({r_cnt,c_cnt})
//                 {2'd0,2'd0}: begin
//                     pool_lin[(0*3*3+0*3+0)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+0*3+0)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+0*3+0)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd0,2'd1}: begin
//                     pool_lin[(0*3*3+0*3+1)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+0*3+1)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+0*3+1)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd0,2'd2}: begin
//                     pool_lin[(0*3*3+0*3+2)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+0*3+2)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+0*3+2)*8 +: 8] <= ans_2x2_D3;
//                 end



//                 {2'd1,2'd0}: begin
//                     pool_lin[(0*3*3+1*3+0)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+1*3+0)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+1*3+0)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd1,2'd1}: begin
//                     pool_lin[(0*3*3+1*3+1)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+1*3+1)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+1*3+1)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd1,2'd2}: begin
//                     pool_lin[(0*3*3+1*3+2)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+1*3+2)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+1*3+2)*8 +: 8] <= ans_2x2_D3;
//                 end



//                 {2'd2,2'd0}: begin
//                     pool_lin[(0*3*3+2*3+0)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+2*3+0)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+2*3+0)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd2,2'd1}: begin
//                     pool_lin[(0*3*3+2*3+1)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+2*3+1)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+2*3+1)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 {2'd2,2'd2}: begin
//                     pool_lin[(0*3*3+2*3+2)*8 +: 8] <= ans_2x2_D1;
//                     pool_lin[(1*3*3+2*3+2)*8 +: 8] <= ans_2x2_D2;
//                     pool_lin[(2*3*3+2*3+2)*8 +: 8] <= ans_2x2_D3;
//                 end
//                 // default: 
//             endcase
//         end
//     end

// endmodule
