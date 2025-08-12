module N_bit_fixed_point_divider
  #(parameter N = 8)
  (input logic [N-1:0] dividend,
   input logic [N-1:0] divisor,
   output logic [N-1:0] quotient);
  
  reg [(N+4)-1:0] temp_dividend; // after shifting bits should not be truncated
  
  always_comb begin
    temp_dividend = 'b0;     
    if(divisor == 'b0) begin
      quotient = {N{1'b1}}; // indicating overflow
    end
    else begin
      temp_dividend = dividend << 4;
      quotient = temp_dividend/divisor; // shifting by 4 to make decimal point .4 digit into binary
    end
  end
  
endmodule
