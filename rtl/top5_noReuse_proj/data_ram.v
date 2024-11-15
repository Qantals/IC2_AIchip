`timescale 1ns/1ps
module data_ram (
    input clk,
    input wen,
    input [7:0] din,
    output reg [19*8-1:0] dout
);

    integer j;
    reg [7:0] mem [19-1:0];
    always @(posedge clk) begin
        if(wen) begin
            for(j = 0; j <= 17; j = j + 1)
                mem[j] = mem[j + 1];   // scan in high address, equals to right shift
            mem[18] = din;
        end
    end

    integer i;
    always @(*) begin
        for(i = 0; i <= (19-1); i = i + 1) begin
            dout[(i*8) +: 8] = mem[i];
        end
    end

endmodule
