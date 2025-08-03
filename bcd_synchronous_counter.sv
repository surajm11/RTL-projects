// Code your design here

module bcd_synchronous_counter
  #(parameter N = 4)
  (input clk,
   input rst_n,
   input enable,
   output logic [3:0] count);
  
  always@(posedge clk) begin
    if(!rst_n) begin
      count <= 'b0;
    end
    else if(enable) begin
      if(count == 4'b1001)
        count <= 'b0;
      else
        count <= count + 1'b1;
    end
    else
      count <= count;
  end
  
endmodule

