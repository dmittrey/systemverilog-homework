//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  typedef enum bit [1:0]
  {
    S0 = 2'd0,
    S1 = 2'd1,
    S2 = 2'd2
  } 
  state_e;
  
  state_e state, next_state;

  // State register

  always_ff @ (posedge clk)
    if (rst)
      state <= S0;
    else
      state <= next_state;

  // Next state logic

  always_comb
  begin
      next_state = state;

      case (state)
      S0: if (~ a) next_state = S1;
      S1: if (  a) 
            next_state = S2;
      // Не задерживаемся во состоянии, тк у нас автомат Милли, 
          // то по выходному можно определить да/нет 
      S2: next_state = S0;
      endcase
  end
  
  // Output logic based on current state
  assign detected = ((~ a) & state == S2);

endmodule
