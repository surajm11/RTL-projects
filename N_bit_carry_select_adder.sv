// Code your design here
module N_bit_carry_select_adder
  #(parameter N = 16, parameter BLOCK_SIZE = 4)
  ( input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout
  );
  
//  logic cin_0; // input carry 0
//  logic cin_1; // input carry 1
  
  logic [N-1:0] cout_0; // carry 0 adders forward carry
  logic [N-1:0] sum_carry_0; // carry 0 sum

  logic [N-1:0] cout_1; // carry 0 adders forward carry
  logic [N-1:0] sum_carry_1; // carry 1 sum
  
  always_comb begin
    // for carry 0  
    cout_0[0] = (a[0] && b[0]) || (a[0] && 1'b0) || (1'b0 && b[0]);
    sum_carry_0[0] =  a[0] ^ 1'b0 ^ b[0];
    
    // for carry 1 
    cout_1[0] = (a[0] && b[0]) || (a[0] && 1'b1) || (1'b1 && b[0]);
    sum_carry_1[0] =  a[0] ^ 1'b1 ^ b[0];  
    
    sum[0] = cin ? sum_carry_1[0] : sum_carry_0[0];
    
    cout = cin ? cout_1[N-1] : cout_0[N-1];
  
  end
 
  generate
    genvar i;
    for(i = 1 ; i < N ; i++) begin
      // for carry 0
      assign sum_carry_0[i] = a[i] ^ b[i] ^ cout_0[i-1];
      assign cout_0[i] = (a[i] && b[i]) || (a[i] && cout_0[i-1]) || (b[i] && cout_0[i-1]); 
      
      // for carry 1
      assign sum_carry_1[i] = a[i] ^ b[i] ^ cout_1[i-1];
      assign cout_1[i] = (a[i] && b[i]) || (a[i] && cout_1[i-1]) || (b[i] && cout_1[i-1]);     
      
      //final sum selection
      assign sum[i] = cin ? sum_carry_1[i] : sum_carry_0[i];
      
    end
  endgenerate
  
endmodule
