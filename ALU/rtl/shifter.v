module shifter #(
    parameter BIT_LENGTH = 8
) (
    input [BIT_LENGTH-1:0] x,
    input [$clog2(BIT_LENGTH):0] shamt,
    input shift_right,
    output reg [BIT_LENGTH-1:0] result
);
  always @(*)
    if (shift_right == 1) result = x >> shamt;
    else result = x << shamt;
endmodule
