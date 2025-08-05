// Code your design here

module N_bit_siso
  #(parameter N = 5)
  (input clk,
   input rst_n,
   input din,
   output logic dout);
  
  reg [N-1:0] temp;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      temp <= 'b0;
    end
    else
      temp <= {temp[N-2:0], din};
  end
  
  assign dout = temp[N-1];
  
endmodule
