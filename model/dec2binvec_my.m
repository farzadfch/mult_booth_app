% Author:         Farzad Farshchi
% Date:           Dec 2012
% Compiler:       MATLAB R2012b

function out = dec2binvec_my( dec, bits )
    out = false( 1, bits );
    for i=1:(bits-1)
        if( mod( dec, 2 ) == 1 )
            out(i) = true;
        end
        dec = floor(dec / 2);
    end
    out( bits ) = dec;
end
