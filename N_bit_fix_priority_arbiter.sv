// Code your design here

module N_bit_fix_priority_arbiter
  #(parameter N = 4)
  (input logic [N-1:0] req,
   output logic [N-1:0] grant);
  
  // first create priority encode then make binary to one hot
  int i;
  reg [$clog2(N)-1:0] temp;
 // priority encoder 
  always_comb begin
    temp = 'b0;
    for(i = N-1; i >= 0 ; i--) begin
      if(req[i])
        temp = i;
      else
        temp = temp;
    end
  end
  // one hot
  always_comb begin
    grant = 'b0;
    if(req)
      grant[temp] = 1'b1;
    else
      grant = 'b0;
  end
  
endmodule
  
// easier way of doing it
/*
  always_comb begin
    grant = 'b0;
    for(i = 0; i < N ; i++) begin
      if(req[i])
        grant = i;
      else
        grant = grant;
    end
  end
  
*/
