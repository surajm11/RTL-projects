
module master_slave_jk_ff
  (input logic clk,
   input logic rst_n,
   input logic j,
   input logic k,
   output logic q);
  
  wire mst_feed_and1, mst_feed_and2;
  wire mst_latch_and1, mst_latch_and2;
  wire slv_feed_and1, slv_feed_and2;
  wire slv_latch_and1, slv_latch_and2;
  
  
endmodule
