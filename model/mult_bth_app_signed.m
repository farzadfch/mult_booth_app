%
% Author:         Farzad Farshchi <farzadfch@yahoo.com>
% Date:           Dec 2012
% Compiler:       MATLAB R2012b

function out = mult_bth_app_signed( in1, in2, wl, vbl )
%                                   x  , y
    if( in1 <= 2^(wl-1)-1 && in1 >= -2^(wl-1) && in2 <= 2^(wl-1)-1 && in2 >= -2^(wl-1) )
        in1bin = [ 0 dec2binvec_my( in1, wl ) ];
        pp = false( wl/2, wl*2 );
        for i = 1:wl/2
            pp(i,:) = dec2binvec_my( pp_generator( binvec2dec_my( in1bin(2*i-1:2*i+1) ),...
                in2 ) * 4^(i-1), wl*2 );
            pp(i,1:vbl) = false;
        end
        out = 0;
        for i = 1:wl/2
            out = out + binvec2dec_signed( pp(i,:) );
        end
    else
        display( 'out of range input' );   
    end
end