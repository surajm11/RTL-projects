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
  reg sending;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      temp <= 'b0;
      count <= 'b0;
      sending <= 'b0;
    end
    else if(load) begin
      temp <= din;
      count <= 'b0;
      sending <= 'b1;
    end
    else if(enable && sending) begin // what if enable is high for all the clk cycles?
      dout <= temp[N-1];
      temp <= temp << 1;
      valid <= 'b1;
      if(count == N-1) begin
        count <= 'b0;
        sending <= 'b0;
      end
      else begin      
        count <= count + 1'b1;
        sending <= 'b1;
      end
    end
    else begin
      dout <= 'b0;
      valid <= 'b0;
    end  
  end
  
endmodule
      
