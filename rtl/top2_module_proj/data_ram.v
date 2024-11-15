`timescale 1ns/1ps
module data_ram (
    input clk,
    input wen,
    input [$clog2(8*8*1)-1:0] waddr,
    input [7:0] din,
    output reg [8*8*1*8-1:0] dout
);
    reg [7:0] mem [8*8*1-1:0];
    always @(posedge clk) begin
        if(wen)
            mem[waddr] <= din;
    end

    integer i;
    always @(*) begin
        for(i = 0; i <= (8*8*1-1); i = i + 1) begin
            dout[(i*8) +: 8] = mem[i];
        end
    end

endmodule
