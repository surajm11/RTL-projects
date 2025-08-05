// Code your design here
module N_bit_comparator
  #(parameter N = 5)
  (input [N-1:0] in_a,
   input [N-1:0] in_b,
   output logic a_eq_b,
   output logic a_gt_b,
   output logic a_les_b);
  
  always_comb begin
    if(in_a == in_b) begin
      a_eq_b = 'b1;
      a_gt_b = 'b0;
      a_les_b = 'b0;
    end
    else if(in_a > in_b) begin
      a_eq_b = 'b0;
      a_gt_b = 'b1;
      a_les_b = 'b0; 
    end
    else begin
      a_eq_b = 'b0;
      a_gt_b = 'b0;
      a_les_b = 'b1;
    end
  end
  
endmodule
    
  
  
