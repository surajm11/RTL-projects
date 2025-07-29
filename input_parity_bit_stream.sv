// Code your design here
module input_parity_bit_stream
  #(parameter N = 4)
  (input clk,
   input rst_n,
   input in_bit,
   input enable,
   output logic even_parity,
   output logic odd_parity);
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      even_parity <= 'b0;
      odd_parity <= 'b0;
    end
    else begin
      if(enable) begin
        even_parity <= in_bit ^ even_parity ? 1'b1 : 1'b0;
        odd_parity <= ~(in_bit ^ odd_parity) ? 1'b1 : 1'b0;
      end
      else begin
        even_parity <= even_parity;
        odd_parity <= odd_parity;
      end
    end
  end
  
endmodule
      
