module weight_ram (
    input clk,
    input wen,
    input [$clog2(3*3*3*2)-1:0] waddr,
    input [7:0] din,
    output reg [3*3*3*2*8-1:0] dout  // 3*3*3*2([0]:conv; [1]:connect)
);
    reg [7:0] mem [3*3*3*2-1:0];
    always @(posedge clk) begin
        if(wen)
            mem[waddr] <= din;
    end

    integer i;
    always @(*) begin
        for(i = 0; i <= (3*3*3*2-1); i = i + 1) begin
            dout[(i*8) +: 8] = mem[i];
        end
    end

endmodule
