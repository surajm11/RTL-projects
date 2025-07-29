module N_bit_parity
  #(parameter N = 4)
  (input [N-1:0] in,
   output logic even_parity,
   output logic odd_parity);
  
  
  always_comb begin
    even_parity = ^in ? 1'b1 : 1'b0;
    odd_parity = ~^in ? 1'b1 : 1'b0;
  end
  
endmodule
