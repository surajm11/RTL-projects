// Code your design here
module N_bit_prbs_generator
  #(parameter N = 8)
  (input logic clk,
   input logic rst_n,
   input logic enable,
   output logic prbs_bit,
   output logic [N-1:0] prbs_state);
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      prbs_state <= 8'b1010_1100;
    end
    else if(enable) begin
      prbs_state <= {prbs_state[N-2:0], prbs_state[N-1] ^ prbs_state[N-3]};
    end
    else begin
      prbs_state <= prbs_state;
    end    
  end
  
  always_comb begin
    prbs_bit = prbs_state[N-1];
  end
  
endmodule
   
