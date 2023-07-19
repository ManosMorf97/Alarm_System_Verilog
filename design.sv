// Code your design here
// Code your design here

module Alarm_System(Code,Motion1,Motion2,Reed,Active,Alarm);
  input [5:0] Code;
  input Motion1;
  input Motion2;
  input Reed;
  output Active;
  output Alarm;
  reg current_active_state;
  reg current_alarm_state;
  reg output_active_state;
  reg output_alarm_state;
  reg clk;
  wire alarm_activation;
  wire wire_alarm;
  assign Active=output_active_state;
  assign wire_alarm=Motion1&Motion2|Reed;
  assign Alarm=output_alarm_state;
  initial begin
    current_active_state<=0;
    current_alarm_state<=0;
    clk<=0;
    forever
      #0.5clk<=~clk;
  end
  always@(posedge clk) begin
    case(Code)
      5'b11111 : output_active_state<=1'b1;
      5'b00100 : output_active_state<=1'b0;
      default:output_active_state<=current_active_state;
    endcase
    #0.5current_active_state<=output_active_state;
  end
  always@(posedge clk)begin
    if(~current_alarm_state)
      begin
        case(current_active_state)
          1'b0:output_alarm_state<=1'b0;
          1'b1:output_alarm_state<=wire_alarm;
          default:output_alarm_state<=1'b0;
        endcase
      end
    else
      output_alarm_state<=current_active_state;
    //end-if-else-block
    #0.5current_alarm_state<=output_alarm_state;
  end
endmodule