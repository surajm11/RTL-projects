// Code your design here

module BCD_time_counter
  (input logic clk,
   input logic rst_n,
   input logic en,
   output logic [3:0] hour_tens,
   output logic [3:0] hour_units,
   output logic [3:0] min_tens,
   output logic [3:0] min_units,
   output logic [3:0] sec_tens,
   output logic [3:0] sec_units);
  
  // 3 counters for hours, min, sec
  
  logic [7:0] sec_count;
  logic [7:0] min_count;
  logic [7:0] hr_count;
  
  logic en_min;
  logic en_hr;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      sec_count <= 'b0;
      en_min <= 'b0;
    end
    else if(en) begin
     if(sec_count == 8'b00111011) begin
      sec_count <= 'b0;
      en_min <= 'b1;
      end
     else begin
      sec_count <= sec_count + 1'b1;
      en_min <= 'b0;
     end
    end
    else begin
      sec_count <= sec_count;
      en_min <= 'b0;
    end
  end
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      min_count <= 'b0;
      en_hr <= 'b0;
    end
    else if(en_min) begin
      if(min_count == 8'b00111011) begin
      min_count <= 'b0;
      en_hr <= 'b1;
      end
      else begin
      min_count <= min_count + 1'b1;
      en_hr <= 'b0;
      end
    end
    else begin
      min_count <= min_count;
      en_hr <= en_hr;
    end     
  end  
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      hr_count <= 'b0;
    end
    else if(en_hr) begin
      if(hr_count == 8'b00010111) begin
      hr_count <= 'b0;
      end
      else begin
      hr_count <= hr_count + 1'b1;
      end
    end
    else begin
      hr_count <= hr_count;
    end     
  end  
  
  
  always_comb begin
    hour_tens  = hr_count / 10;
	  hour_units = hr_count % 10;
	  min_tens   = min_count / 10;
	  min_units  = min_count % 10;
	  sec_tens   = sec_count / 10;
	  sec_units  = sec_count % 10;
  end 
  
  
endmodule


   
  
