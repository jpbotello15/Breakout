`default_nettype none 

module SevenSegmentControl
  (output logic [6:0] HEX7, HEX6, HEX5, HEX4,
   output logic [6:0] HEX3, HEX2, HEX1, HEX0,
   input logic  [3:0] BCD7, BCD6, BCD5, BCD4,
   input logic  [3:0] BCD3, BCD2, BCD1, BCD0,
   input logic  [7:0] turn_on);

   

   SevenSegmentDigit ssd0(.bcd(BCD0),
                          .segment(HEX0),
                          .blank(turn_on[0]));
   SevenSegmentDigit ssd1(.bcd(BCD1),
                          .segment(HEX1),
                          .blank(turn_on[1]));
   SevenSegmentDigit ssd2(.bcd(BCD2),
                          .segment(HEX2),
                          .blank(turn_on[2]));
   SevenSegmentDigit ssd3(.bcd(BCD3),
                          .segment(HEX3),
                          .blank(turn_on[3]));
   SevenSegmentDigit ssd4(.bcd(BCD4),
                          .segment(HEX4),
                          .blank(turn_on[4]));
   SevenSegmentDigit ssd5(.bcd(BCD5),
                          .segment(HEX5),
                          .blank(turn_on[5]));
   SevenSegmentDigit ssd6(.bcd(BCD6),
                          .segment(HEX6),
                          .blank(turn_on[6]));
   SevenSegmentDigit ssd7(.bcd(BCD7),
                          .segment(HEX7),
                          .blank(turn_on[7]));

   

endmodule: SevenSegmentControl
  