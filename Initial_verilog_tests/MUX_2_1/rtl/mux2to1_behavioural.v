module mux2to1 (
    A,
    B,
    X,
    out1
);
  input A, B, X;
  output reg out1;
  always @(*) begin
    if (X == 0) out1 = A;
    else out1 = B;
  end
endmodule
