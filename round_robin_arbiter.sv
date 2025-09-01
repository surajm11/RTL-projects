// Code your design here

module round_robin_arbiter
  (input logic clk,
   input logic rst_n,
   input logic [2:0] req,
   output logic [2:0] grant);
  
  typedef enum logic [3:0] {
    IDLE = 4'b0001,
    REQ_0 = 4'b0010,
    REQ_1 = 4'b0100,
    REQ_2 = 4'b1000
  } state ;
  
  reg [3:0] nx_st, st;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      st <= 'b0;
    end
    else begin
      st <= nx_st;
    end
  end
  
  always_comb begin
    case(st)
      IDLE : begin
        if(req[0]) nx_st = REQ_0;
        else if(req[1]) nx_st = REQ_1;
        else if(req[2]) nx_st = REQ_2;
        else nx_st = IDLE;
      end
      REQ_0 : begin
        if(req[1]) nx_st = REQ_1;
        else if(req[2]) nx_st = REQ_2;
        else if(req[0]) nx_st = REQ_0;
        else nx_st = IDLE;
      end
      REQ_1 : begin
        if(req[2]) nx_st = REQ_2;
        else if(req[0]) nx_st = REQ_0;
        else if(req[1]) nx_st = REQ_1;
        else nx_st = IDLE;
      end
      REQ_2 : begin
        if(req[0]) nx_st = REQ_0;
        else if(req[1]) nx_st = REQ_1;
        else if(req[2]) nx_st = REQ_2;
        else nx_st = IDLE;
      end      
      default : nx_st = IDLE;
    endcase
    
  end
  
  always_comb begin
    case(st) 
      IDLE : grant = 3'b000;
      REQ_0 : grant = 3'b001;
      REQ_1 : grant = 3'b010;
      REQ_2 : grant = 3'b100;
      default : grant = 3'b000;
    endcase
  end
  
endmodule
 
        
