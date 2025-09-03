// clock generation in tb -----------------------------------------------------------------------

initial begin
  clk = 'b0;
always 
  #5 clk = ~clk;
end

// other way of doing it

initial begin
  clk = 0;
  forever #5 clk = ~clk ;
end

// reset generation ------------------------------------------------------------------
initial begin
  rst_n = 'b0;
  #20
  rst_n = 'b1;
end

// dumping waves ------------------------------------------------------------------------------------

$dumpfile("dump.vcd"); // dump file - value change dump , ieee standard format for simulations.
$dumpvars(0, tb); // 0 is scope means level of hierarchy which we need dump, 0 indicate infinte hier , and tb is module

// initial blocks ----------------------------------------------------------------------------
// initial blocks run only once at t =0 in simulations and all initial block run parallel
// example below

initial begin
  a = 2'b00; b = 2'b01;
  #10;
  a = 2'b11 ; b = 2'b11;
end

initial begin
  #500 $finish; // simulation control
end

// in terms of giving delay ---------------------------------------------------------
//delay
// #<time> statement; // means wait for this much <time> then execute the statement
#10; //pausing the silulation for 10 seconds, closed with semicolon correct
#10 a = 'b11 ; // wait for 10 seconds then assign the value, closed with semicolon correct
#10 // leaving empty is wrong

// event control ----------------------------------------------------------------------

// @(event_expression) statement
// @posedge clk
// @negedge clk
// @signal

initial begin
  @(posedge clk)
  data = 8'haa; // data at 1st clk edge
  @(posedge clk)
  data = 8'hbb; // data at 2nd clock edge
end

// above one is not scalable with design so need to apply with loops

initial begin
  data = 0;
  @(posedge clk)
  for(i =0; i< 15; i++) begin // looping and changing data at every posedge of clock
    @(posedge clk)
    data = i;
    $display("Time= %0t Data = %0d", $time, data);
  end
  $finish;
end



  
  
  













  



  
  


