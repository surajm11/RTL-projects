// Code your design here
// Code your design here
module N_bit_adder_substractor
  #(parameter N = 4)
  (input logic [N-1:0] a,
   input logic [N-1:0] b,
   input logic mode, 
   output logic [N-1:0] out, 
   output logic carry_borrow); 
  
  logic [N-1:0] c;
  logic [N-1:0] b_xor;
  
  generate 
    genvar j;
    for(j = 0; j < N ; j++) begin
      assign b_xor[j] = b[j] ^ mode;
    end
  endgenerate
      
  always_comb begin
    c[0] = (a[0] && b_xor[0]) || (a[0] && mode) || (b_xor[0] && mode);
    out[0] =  a[0] ^ b_xor[0] ^ mode;
  end
 
  generate
    genvar i;
    for(i = 1 ; i < N ; i++) begin
      assign out[i] = a[i] ^ b_xor[i] ^ c[i-1]; // 1 bit full substractor
      assign c[i] = (a[i] && b_xor[i]) || (a[i] && c[i-1]) || (b_xor[i] && c[i-1]); // 1 bit borrow logic 
    end
  endgenerate
  
  assign carry_borrow = c[N-1];
  
endmodule
  
  
  
  
  
    
    
