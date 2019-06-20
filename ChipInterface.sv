`default_nettype none

module chipInterface
  (output logic [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
   input logic [17:0] SW,
   input logic [3:0] KEY);

   logic [3:0] bcd0, bcd1, bcd2, bcd3, bcd4, bcd5, bcd6, bcd7;

   always_comb begin
     bcd0 = SW[7:4];
     bcd1 = SW[7:4];
     bcd2 = SW[7:4];
     bcd3 = SW[7:4];
     bcd4 = SW[7:4];
     bcd5 = SW[7:4];
     bcd6 = SW[7:4];
     bcd7 = SW[7:4];
     unique case(~KEY)
      4'd0: bcd0 = SW[3:0]; 
      4'd1: bcd1 = SW[3:0]; 
      4'd2: bcd2 = SW[3:0]; 
      4'd3: bcd3 = SW[3:0]; 
      4'd4: bcd4 = SW[3:0]; 
      4'd5: bcd5 = SW[3:0]; 
      4'd6: bcd6 = SW[3:0]; 
      4'd7: bcd7 = SW[3:0];  
     endcase
  end

   SevenSegmentControl ssc(.HEX7(HEX7),
                           .HEX6(HEX6),
                           .HEX5(HEX5),
                           .HEX4(HEX4),
                           .HEX3(HEX3),
                           .HEX2(HEX2),
                           .HEX1(HEX1),
                           .HEX0(HEX0),
                           .BCD7(bcd7),
                           .BCD6(bcd6),
                           .BCD5(bcd5),
                           .BCD4(bcd4), 
                           .BCD3(bcd3),
                           .BCD2(bcd2),
                           .BCD1(bcd1),
                           .BCD0(bcd0),
                           .turn_on(~SW[17:10]));


endmodule: chipInterface
               
