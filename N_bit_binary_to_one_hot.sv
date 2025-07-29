// Code your design here

module N_bit_binary_to_one_hot
  #(parameter N = 16)
  (input [$clog2(N)-1:0] binary_in,
   output logic [N-1:0] one_hot_out);
  
  always_comb begin
    one_hot_out = 'b0;
    if(|binary_in)
     one_hot_out[binary_in] = 1'b1;
    else
     one_hot_out = 'b1;
  end
  
endmodule
  
  
