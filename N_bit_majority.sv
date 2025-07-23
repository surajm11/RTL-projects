// Code your design here
module N_bit_majority
  #(parameter N = 4)
  (input [N-1:0] in,
   output logic out);
  
  int i;
  reg [$clog2(N)-1:0] store;
  always_comb begin
    store = 'b0;
    for(i =0; i < N; i++) begin
      if(in[i] == 1'b1)
        store = store + 1'b1;
      else
        store = store;
    end
  end
  
  assign out = (store > (N >>1))? 1'b1:1'b0;
  
endmodule

