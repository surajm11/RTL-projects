// Code your design here

module N_bit_sipo
  #(parameter N = 4)
  (
    input logic clk,
    input logic rst_n,
    input logic enable,
    input logic din,
    output logic [N-1:0] dout
  );
  
  reg [N-1:0] temp;
  reg [$clog2(N):0] count;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      temp <= 'b0;
      count <= 'b0;
    end
    else if(enable) begin
      temp <= {din, temp[N-1:1]};
      if(count == N)
        count <= 'b0;
      else
      count <= count + 1'b1;
    end
    else begin
      temp <= temp;
      count <= 'b0;
    end
  end
  
  //assign dout = (count == 3'b100)? temp : 'b0;
  assign dout = temp;
  
endmodule
      
  
