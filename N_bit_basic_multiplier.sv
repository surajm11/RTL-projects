module N_bit_basic_multiplier
  #(parameter N = 4)
  (input logic [N-1:0] a,
   input logic [N-1:0] b,
   output logic [2*N-1:0] out);
  
  always_comb begin
    out = a * b;
  end
  
endmodule
