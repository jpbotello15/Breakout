`default_nettype none

module BCDtoSevenSegment
  (input logic [3:0] bcd, 
   output logic [6:0] segment);

  always_comb begin
    case(bcd)
      4'd0: segment = 7'b000_0001; 
      4'd1: segment = 7'b100_1111; 
      4'd2: segment = 7'b001_0010; 
      4'd3: segment = 7'b000_0110; 
      4'd4: segment = 7'b100_1100; 
      4'd5: segment = 7'b010_0100; 
      4'd6: segment = 7'b010_0000; 
      4'd7: segment = 7'b000_1111; 
      4'd8: segment = 7'b000_0000; 
      4'd9: segment = 7'b000_1100; 
      default: segment = 7'b111_1111;
     endcase
  end

endmodule: BCDtoSevenSegment

module BCDtoSevenSegmentTester;
 
   logic [6:0] segment;
   logic [3:0] bcd;   
 
   BCDtoSevenSegment DUT(.*);
   
   initial begin
     $monitor($time,,
       "bcd = %b, , segment = %b",
	bcd, segment);
        
            bcd = 4'd0;
        #20 bcd = 4'd1;
        #20 bcd = 4'd2;
        #20 bcd = 4'd3;
        #20 bcd = 4'd4;
        #20 bcd = 4'd5;
        #20 bcd = 4'd6;
        #20 bcd = 4'd7;
        #20 bcd = 4'd8;
        #20 bcd = 4'd9;
        #20 bcd = 4'd15;
        #20 $finish;
   
   end 
endmodule: BCDtoSevenSegmentTester
  
