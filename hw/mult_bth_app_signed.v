// Author:        Farzad Farshchi
// Date:          Dec 2012
// Simulator:     ModelSim 6.6
// Compiler:      Design Compiler C-2009.06-SP5

module mult_bth_app_signed( out, in1, in2 );
  parameter wl = 4, vbl = 0;
  output reg signed [wl*2-1:0] out;
  input signed [wl-1:0] in1, in2;
  //                    x, y
  
  function signed [wl*2-1:0] pp_generator;
    input [2:0] part_x;
    input signed [wl-1:0] y;  
    begin
      case( part_x )
        'b000: pp_generator = 0;
        'b001: pp_generator = y;
        'b010: pp_generator = y;
        'b011: pp_generator = 2*y;
        'b100: pp_generator = -(2*y);
        'b101: pp_generator = -y;
        'b110: pp_generator = -y;
        'b111: pp_generator = 0;
      endcase
    end
  endfunction
  
  reg [wl*2-1:0] pp [0:wl/2-1];
  reg [2:0] part_x;
  integer i, j;
  
  always @*
  begin
    pp[0] = pp_generator( {in1[1], in1[0], 1'b0}, in2 ); 
    for( i = 1; i <= wl/2-1; i = i + 1 )
    begin
      part_x[0] = in1[i*2-1]; part_x[1] = in1[i*2]; part_x[2] = in1[i*2+1];
      pp[i] = pp_generator( part_x, in2 ) << 2*i;
    end
    
    for( i = 0; i <= wl/2-1; i = i + 1 )
      for( j = 0; j <= vbl - 1; j = j + 1 )
        pp[i][j] = 1'b0;
  end
  
  always @*
  begin
    out = 0;
    for( i = 0; i <= wl/2-1; i = i + 1 )
      out = out + pp[i];
  end
endmodule
