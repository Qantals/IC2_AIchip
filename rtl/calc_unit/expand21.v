module expand21 (
    input signed [15:0] dot,
    output signed [20:0] expand  
);
    assign expand = dot;
    
endmodule
