module bcd_adder
  (input logic [3:0] a,
   input logic [3:0] b,
   input logic c,
   output logic [3:0] sum,
   output logic carry);
  
  reg [4:0] temp;
  
  always_comb begin
    temp = 'b0;
    sum = 'b0;
    temp = a + b + c;
    if(temp > 4'b1001) begin
      sum = temp + 4'b0110;
      carry = 'b1; 
    end
    else begin
      sum = temp;
      carry = 'b0; 
    end
  end

  
endmodule
