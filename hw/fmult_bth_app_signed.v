//
// Author:        Farzad Farshchi <farzadfch@yahoo.com>
// Date:          Dec 2012
// Simulator:     ModelSim 6.6
// Compiler:      Design Compiler C-2009.06-SP5

module fmult_bth_app_signed( out, in1, in2 );
  parameter wl_out = 16, wf_out = 15, wl_in = 16, wf_in1 = 15, wf_in2 = 15,
            vbl = 0;
  localparam point = wf_in1+wf_in2, wi_out = wl_out-wf_out;
  
  output signed [wl_out-1:0] out;
  input signed [wl_in-1:0] in1;
  input signed [wl_in-1:0] in2;
  wire signed [wl_in*2-1:0] p_temp;
  
  mult_bth_app_signed #(wl_in, vbl) u0_mult_bth_app_signed( p_temp, in1, in2 );
  assign out = p_temp[point+wi_out-1:point-wf_out];
endmodule
