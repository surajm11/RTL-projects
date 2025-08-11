// Code your design here

module bidirectional_n_bit_shift_register
  #(parameter N = 4)
  (input clk,
   input rst_n,
   input load,
   input shift_dir,
   input [N-1:0] din,
   input serial_in,
   output logic [N-1:0] dout);
  
  reg [N-1:0] temp;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      temp <= 'b0;
    end
    else if(load) begin
      temp <= din;
    end
    else begin
      if(shift_dir) begin
        temp <= {temp[N-2:0], serial_in};
      end
      else
        temp <= {serial_in, temp[N-1:1]};
    end
  end
  
  always_comb begin
    dout = temp;
  end
  
endmodule
                 
  
   
   
