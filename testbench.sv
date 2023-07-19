// Code your testbench here
// or browse Examples

module test;
  integer i;
  integer j;
  reg Array_Motion[4:0];
  reg Array_Reed[4:0];
  reg[5:0] Array_Codes[6:0];
  reg[5:0] Array_Codes2[2:0];
  reg[5:0] reg_Code;
  reg reg_Motion;
  reg reg_Reed;
  reg reg_act;
  reg reg_alarm;
  wire[5:0] wire_Code;
  wire wire_Motion1;
  wire wire_Motion2;
  wire wire_Reed;
  wire wire_act;
  wire wire_alarm;
  Alarm_System ALS(wire_Code,wire_Motion1,wire_Motion2,wire_Reed,wire_act,wire_alarm);
  assign wire_Code=reg_Code;
  assign wire_Motion1=reg_Motion;
  assign wire_Motion2=reg_Motion;
  assign wire_Reed=reg_Reed;
 
  initial begin
    Array_Codes[0]<=5'b00110;
    Array_Codes[1]<=5'b00001;
    Array_Codes[2]<=5'b11111;
    Array_Codes[3]<=5'b01111;
    Array_Codes[4]<=5'b00100;
    Array_Codes[5]<=5'b01111;
    
    Array_Codes2[0]<=5'b00100;
    Array_Codes2[1]<=5'b11111;
    
    Array_Motion[0]<=1'b0;
    Array_Motion[1]<=1'b1;
    Array_Motion[2]<=1'b0;
    Array_Motion[3]<=1'b1;
    
    Array_Reed[0]<=1'b0;
    Array_Reed[1]<=1'b0;
    Array_Reed[2]<=1'b1;
    Array_Reed[3]<=1'b1;
    for(i=0; i<6; i=i+1) begin
      #1reg_Code<=Array_Codes[i];
      #2reg_act<=wire_act;
      #2$display("Code=%b=>Active=%b",reg_Code,reg_act);
    end
    for(i=0; i<4; i=i+1) begin
      for(j=0; j<2; j=j+1) begin
        #1reg_Code<=Array_Codes2[j];
        #1reg_Motion<=Array_Motion[i];
        #1reg_Reed<=Array_Reed[i];
        #2reg_act<=wire_act;
        #2reg_alarm<=wire_alarm;
        #2$display("  (Motion1=%b Motion2=%b Reed=%b Active=%b)=>Alarm=%b",reg_Motion,reg_Motion,reg_Reed,reg_act,reg_alarm);
      end
    end
  end
endmodule

