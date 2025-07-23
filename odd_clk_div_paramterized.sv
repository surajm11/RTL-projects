// Code your design here
// Code your design here.

module odd_clk_div_paramterized
  #(parameter N = 5)
  (input clk,
   input rst_n,
   output logic div_clk);
  
  reg [$clog2(N)-1:0] count_even;
  reg [$clog2(N)-1:0] count_odd;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count_even <= 'b0;
    end
    else if(count_even == N-1)
      count_even <= 'b0;
    else
      count_even <= count_even + 1'b1;
  end
  
  always@(negedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count_odd <= 'b0;
    end
    else if(count_odd == N-1)
      count_odd <= 'b0;
    else
      count_odd <= count_odd + 1'b1;
  end
  
  assign div_clk = (((count_even) > (N >> 1)) || (count_odd > (N >> 1)));
  
endmodule
