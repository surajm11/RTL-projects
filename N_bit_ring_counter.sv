// Code your design here

module N_bit_ring_counter
  #(parameter N = 4)
  (input clk,
   input rst_n,
   output logic [N-1:0] count);
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count <= {{(N-1){1'b0}}, {1'b1}};
    end
    else begin
      count <= {count[N-2:0], count[N-1]};
    end
  end
  
endmodule
