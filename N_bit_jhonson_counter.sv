// Code your design here

module N_bit_jhonson_counter
  #(parameter N = 5)
  (input clk,
   input rst_n,
   output logic [N-1:0] count);
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count <= 'b0;
    end
    else begin
      count[N-1:0] <= {~count[N-1], count[N-1:1]};
    end
  end
  
endmodule
