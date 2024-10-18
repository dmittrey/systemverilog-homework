//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  wire tr = 1;
  wire fl = 0;
  
  logic c;
  
  /*
                 b
        a     0 -|
  0 ---|         | -- o
       | --- c --|
  1 ---|
  */

  mux inst1 (fl, tr, a, c);

  mux inst2 (fl, c, b, o);

endmodule
