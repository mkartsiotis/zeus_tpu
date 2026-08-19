`timescale 1ns / 1ps

module adder_tb;

  parameter BIT_LENGTH = 8;

  reg [BIT_LENGTH-1:0] x, y;
  reg subtract;
  wire [BIT_LENGTH-1:0] sum;
  wire cout, overflow, is_zero;

  integer i, j;
  integer errors = 0;
  reg [BIT_LENGTH-1:0] expected;

  adder #(
      .BIT_LENGTH(BIT_LENGTH)
  ) dut (
      .x(x),
      .y(y),
      .subtract(subtract),
      .sum(sum),
      .cout(cout),
      .overflow(overflow),
      .is_zero(is_zero)
  );

  initial begin
    for (i = 0; i < (1 << BIT_LENGTH); i = i + 1) begin
      for (j = 0; j < (1 << BIT_LENGTH); j = j + 1) begin
        x = i;
        y = j;
        subtract = 0;
        #1;  // let the combinational logic settle before checking

        expected = x + y;  // BIT_LENGTH+1 wide, so overflow lands in bit[BIT_LENGTH]
        // Addition Check
        subtract = 0;
        #1;
        expected_sum  = x + y;
        expected_cout = (x + y) >> BIT_LENGTH;
        expected_ovf  = (x[7] == y[7]) && (sum[7] != x[7]);

        if (sum !== expected_sum || cout !== expected_cout || overflow !== expected_ovf) begin
          errors = errors + 1;
          $display("ADD FAIL: x=%0d y=%0d -> sum=%0d cout=%0b ovf=%0b", x, y, sum, cout, overflow);
        end

        if (is_zero !== (sum == 0)) begin
          errors = errors + 1;
          $display("IS_ZERO FAIL: sum=%0d is_zero=%0b", sum, is_zero);
        end
        if (sum !== expected) begin
          errors = errors + 1;
          $display("FAIL: x=%0d y=%0d -> sum=%0d cout=%0b (expected sum=%0d cout=%0b)", x, y, sum,
                   cout, expected[BIT_LENGTH-1:0], expected[BIT_LENGTH]);
        end
        if ((expected == 0 && is_zero == 1) || (expected != 0 && is_zero == 0));
        else begin
          errors = errors + 1;
          $display("FAIL!IS ZERO ERROR!CASE x=%0d, y=%0d, sum=%0d, exp=%0d, is_zero=%0d", x, y,
                   sum, expected, is_zero);
        end
        x = i;
        y = j;
        subtract = 1;
        #1;  // let the combinational logic settle before checking

        expected = x - y;  // BIT_LENGTH+1 wide, so overflow lands in bit[BIT_LENGTH
        if (sum !== expected) begin
          errors = errors + 1;
          $display("FAIL: x=%0d y=%0d -> sum=%0d cout=%0b (expected sum=%0d cout=%0b)", x, y, sum,
                   cout, expected[BIT_LENGTH-1:0], expected[BIT_LENGTH]);
        end
        if ((expected == 0 && is_zero == 1) || (expected != 0 && is_zero == 0));
        else begin
          errors = errors + 1;
          $display("FAIL!IS ZERO ERROR!CASE x=%0d, y=%0d, sum=%0d, exp=%0d, is_zero=%0d", x, y,
                   sum, expected, is_zero);
        end
      end
    end

    if (errors == 0) $display("ALL %0d TESTS PASSED", (1 << BIT_LENGTH) * (1 << BIT_LENGTH));
    else $display("%0d TEST(S) FAILED", errors);

    $finish;
  end
endmodule
