module adder #(
    parameter BIT_LENGTH = 8
) (
    input [BIT_LENGTH-1:0] x,
    y,
    input subtract,
    output [BIT_LENGTH-1:0] sum,
    output cout,
    overflow,
    is_zero
);
  wire [BIT_LENGTH-1:0] y_mod = y ^ {BIT_LENGTH{subtract}};
  assign {cout, sum} = x + y_mod + subtract;
  assign overflow = (x[BIT_LENGTH-1] == y_mod[BIT_LENGTH-1]) &&
                   (sum[BIT_LENGTH-1] != x[BIT_LENGTH-1]);
  assign is_zero = (sum == 0);
endmodule
