`default_nettype none

`ifndef COMPONENT
typedef enum {Adder, Comparator, Subtractor} comp_t;
`define COMPONENT
`endif


module Adder
  (output logic [3:0] out, 
   input  logic [3:0] a, b,
   input  logic [4:0] bench);

  logic a_flip, a_zero, a_ones, b_flip, b_zero, b_ones;

  bench2error b2e(.bench(bench),
                  .component(Adder),
                  .a_flip(a_flip), 
                  .a_zero(a_zero), 
                  .a_ones(a_ones), 
                  .b_flip(b_flip), 
                  .b_zero(b_zero), 
                  .b_ones(b_ones));
   
  always_comb begin 
    if (a_flip) out = {a[3:1], ~a[0]} + b;
    else if (a_zero) out = 4'b0 + b;
    else if (a_ones) out = 4'b1111 + b;
    else if (b_flip) out = a + {b[3:1], ~b[0]};
    else if (b_zero) out = a + 4'b0;
    else if (b_ones) out = a + 4'b1111;
    else
      out = a + b;
  end

endmodule : Adder

module Comparator
  (output logic       altb, 
   input  logic [3:0] a, b,
   input  logic [4:0] bench);

  logic a_flip, a_zero, a_ones, b_flip, b_zero, b_ones;

  bench2error b2e(.bench(bench),
                  .component(Comparator),
                  .a_flip(a_flip), 
                  .a_zero(a_zero), 
                  .a_ones(a_ones), 
                  .b_flip(b_flip), 
                  .b_zero(b_zero), 
                  .b_ones(b_ones));
   
  always_comb begin 
    if (a_flip)      altb = ({a[3:1], ~a[0]} < b);
    else if (a_zero) altb = (4'b0 < b);
    else if (a_ones) altb = (4'b1111 < b);
    else if (b_flip) altb = (a < {b[3:1], ~b[0]});
    else if (b_zero) altb = (a < 4'b0);
    else if (b_ones) altb = (a < 4'b1111);
    else
      altb = (a < b);
  end

endmodule : Comparator


module Subtractor
  (output logic [3:0] out, 
   input  logic [3:0] a, b,
   input  logic [4:0] bench);

  logic a_flip, a_zero, a_ones, b_flip, b_zero, b_ones;

  bench2error b2e(.bench(bench),
                  .component(Subtractor),
                  .a_flip(a_flip), 
                  .a_zero(a_zero), 
                  .a_ones(a_ones), 
                  .b_flip(b_flip), 
                  .b_zero(b_zero), 
                  .b_ones(b_ones));
   
  always_comb begin 
    if (a_flip) out = {a[3:1], ~a[0]} - b;
    else if (a_zero) out = 4'b0 - b;
    else if (a_ones) out = 4'b1111 - b;
    else if (b_flip) out = a - {b[3:1], ~b[0]};
    else if (b_zero) out = a - 4'b0;
    else if (b_ones) out = a - 4'b1111;
    else
      out = a - b;
  end

endmodule : Subtractor

   
