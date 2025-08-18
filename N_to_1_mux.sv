module N_to_1_mux
  #(parameter N = 4,
    parameter W = 4)
  (input logic [W-1:0] in[N-1:0],
   input logic [$clog2(N)-1:0] sel,
   output logic [W-1:0] out);
  
  always_comb begin
    out = in[sel];
  end
  
endmodule
