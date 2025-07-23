// Code your design here

module clk_div_even_parameterized
  #(parameter N = 4)
  (input clk,
   input rst_n,
   output reg div_clk);
  
  reg [$clog2(N)-1:0] count;
  reg div_clk_reg;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count <= 'b0;
      div_clk_reg <= 'b0;
    end
    else if(count == N-1) begin
      count <= 'b0;
      div_clk_reg <= !div_clk_reg;
    end
    else begin
      count <= count + 1'b1;
      div_clk_reg <= div_clk_reg;
    end
  end
  
  assign div_clk = div_clk_reg;
  
endmodule
    
      
