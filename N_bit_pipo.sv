// Code your design here

module N_bit_pipo
  #(parameter N = 5)
  (input clk,
   input rst_n,
   input [N-1:0] din,
   input load,
   output logic [N-1:0] dout);
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      dout <= 'b0;
    end
    else if(load) begin
      dout <= din;
    end
    else
      dout <= dout;
  end
  
endmodule
    
