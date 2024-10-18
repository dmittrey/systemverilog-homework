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

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  
  wire tr = 1;
  wire fl = 0;

  logic nota, notb, nota_and_b, notb_and_a;

  mux nota_mux (tr, fl, a, nota);
  mux notb_mux (tr, fl, b, notb);

  mux nota_and_b_mux (fl, nota, b, nota_and_b);
  mux notb_and_a_mux (fl, notb, a, notb_and_a);

  mux res (nota_and_b, notb_and_a, notb_and_a, o);

endmodule
