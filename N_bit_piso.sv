// Code your design here
module N_bit_piso
  #(parameter N = 4)
  (input clk,
   input rst_n,
   input load,
   input enable,
   input [N-1:0] din,
   output logic dout,
   output logic valid );
  
  reg [N-1:0] temp;
  reg [$clog2(N):0] count;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      temp <= 'b0;
      count <= 'b0;
    end
    else if(load) begin
      temp <= din;
      count <= 'b0;
    end
    else if(enable) begin // what if enable is high for all the clk cycles?
      dout <= temp[N-1];
      temp <= temp << 1;
      if(count == N) begin
        count <= 'b0; 
        valid <= 'b0; 
      end
      else begin
        valid <= 'b1;
        count <= count + 1'b1;
      end        
    end     
  end
  
endmodule
      
