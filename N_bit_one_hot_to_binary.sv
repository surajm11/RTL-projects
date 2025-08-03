// Code your design here

module N_bit_one_hot_to_binary
  #(parameter N = 5)
  (input [N-1:0] in_hot,
   output logic [$clog2(N)-1:0] bin);
  
  always_comb begin
    bin = 'b0;
    for( int i= 0; i < N ; i++) begin
      if(in_hot[i])
        bin = i;
      else
        bin = bin;
    end
  end
  
endmodule
  
