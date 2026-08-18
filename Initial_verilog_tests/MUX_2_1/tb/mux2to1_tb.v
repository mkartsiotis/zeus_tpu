module mux2to1_tb;
  reg a, b, sel;
  wire y;
  // Instantiate DUT
  mux2to1 dut (
      .A(a),
      .B(b),
      .X(sel),
      .out1(y)
  );
  initial begin
    // Set up waveform dumping for GTKWave
    $dumpfile("sim/dump.vcd");
    $dumpvars(0, mux2to1_tb);

    // Print header to terminal
    $display("Time | sel a b | y");
    $display("-------------------");

    // Case 1: sel = 0 -> output y should follow 'a'
    sel = 0;
    a   = 1;
    b   = 0;
    #10;  // Wait 10 time units
    $display("%4t |  %b  %b %b | %b", $time, sel, a, b, y);

    // Case 2: sel = 0, change 'a' to 0
    a = 0;
    #10;
    $display("%4t |  %b  %b %b | %b", $time, sel, a, b, y);

    // Case 3: sel = 1 -> output y should follow 'b'
    sel = 1;
    a   = 0;
    b   = 1;
    #10;
    $display("%4t |  %b  %b %b | %b", $time, sel, a, b, y);
    //Case 4:
    sel = 0;
    a   = 0;
    b   = 1;
    #10;
    $display("%4t |  %b  %b %b | %b", $time, sel, a, b, y);
    // Stop simulation
    $finish;
  end

endmodule


