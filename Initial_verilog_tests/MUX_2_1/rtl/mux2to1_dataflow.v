module mux2to1 (
    A,
    B,
    X,
    out1
);
  input A, B, X;
  output out1;
  assign out1 = ((~X & A) | (B & X));
endmodule
