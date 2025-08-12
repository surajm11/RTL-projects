module positve_edge_detector
  (input logic clk,
   input logic rst_n,
   input logic sig_in,
   output logic detect);
  
  reg sig_in_delay;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      sig_in_delay <= 'b0;
    end
    else
      sig_in_delay <= sig_in;
  end
  
  always_comb begin
    detect = sig_in && ~sig_in_delay;
  end
  
endmodule
