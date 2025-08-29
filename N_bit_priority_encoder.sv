// Code your design here

module N_bit_priority_encoder
  #(parameter N = 8)
  (input logic [N-1:0] in,
   output logic [$clog2(N)-1:0] out,
   output logic valid);
  
  int i;
  always_comb begin
    out = 'b0;
    for(i = 0; i < N ; i++) begin
      if(in[i]) begin
        out = i;
      end
      else
        out = out;
    end
  end
  
  always_comb begin
    valid = (in != {{N-1}{1'b0}})? 'b1 : 'b0;
  end
  
endmodule
