

module system();
   logic [3:0] a, b, c, d;
   logic       out;

   top            dut(.*);
   test_design  bench(.*);
   
endmodule : system



module test_design;

   logic [3:0] out;
   logic [3:0] a, b, c, d;
   logic [3:0] ab, cd;

   Adder add(.a(a),
             .b(b),
             .out(ab),
             .bench(4'd10));

   Subtractor sub(.a(c),
                  .b(d),
                  .out(cd),
                  .bench(4'd10));

   Comparator com(.a(ab),
                  .b(cd),
                  .altb(out),
                  .bench(4'd10));

   initial begin
     $monitor($time,,
       "a = %b, b = %b, c = %b, d = %b, a+b = %b, c-d = %b, out = %b",
	a, b, c, d, ab, cd, out);
        
            a = 4'b1001;
            b = 4'b0100;
        
            c = 4'b1001;
            d = 4'b0100;
        #10 c = 4'b0000;
        #10 d = 4'b0001;
        #10 c = 4'b1001;
        #10 d = 4'b0110;
        #10 c = 4'b0001;
            d = 4'b0001;
        
        #10 $finish;

    end
   

endmodule : test_design

