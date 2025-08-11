// Code your design here
module N_bit_substractor
  #(parameter N = 4)
  (input logic [N-1:0] a,
   input logic [N-1:0] b,
   input logic bin, 
   output logic [N-1:0] diff, // a ^b ^ c
   output logic bout); // !a&&b || !a&&c || b&&c
  
  logic [N-1:0] c;
  
  always_comb begin
   // c[0] = bin;
    c[0] = (~a[0] && b[0]) || (~a[0] && bin) || (b[0] && bin);
    diff[0] =  a[0] ^ b[0] ^ bin;
  end
 
  generate
    genvar i;
    for(i = 1 ; i < N ; i++) begin
       assign diff[i] = a[i] ^ b[i] ^ c[i-1]; // 1 bit full substractor
       assign c[i] = (~a[i] && b[i]) || (~a[i] && c[i-1]) || (b[i] && c[i-1]); // 1 bit borrow logic 
    end
  endgenerate
  
  assign bout = c[N-1];
  
endmodule
  
  
  
  
  
    
   
