%
% Author:         Farzad Farshchi <farzadfch@yahoo.com>
% Date:           Dec 2012
% Compiler:       MATLAB R2012b

function out = fmult_bth_app_signed_2( in1, in2, wl_in, wf_out, wf_in, vbl )
    in1 = floor( in1 * 2^wf_in );
    in2 = floor( in2 * 2^wf_in );
    if( in1 <= 2^(wl_in-1)-1 && in1 >= -2^(wl_in-1) && in2 <= 2^(wl_in-1)-1 && in2 >= -2^(wl_in-1) ) 
        in1bin = [ 0 dec2binvec_my( in1, wl_in ) ];
        pp = false( wl_in/2, wl_in*2 );
        for i = 1:wl_in/2
            pp(i,:) = dec2binvec_my( pp_generator( binvec2dec_my( in1bin(2*i-1:2*i+1) ),...
                in2 ) * 4^(i-1), wl_in*2 );
            pp(i,1:vbl) = false;
        end
        out = 0;
        for i = 1:wl_in/2
            out = out + binvec2dec_signed( pp(i,:) );
        end
        out = out / 2^(wf_in*2);
        out = floor( out * 2^wf_out ) / 2^wf_out;
        
    else
        display( 'out of range input' );
    end
    