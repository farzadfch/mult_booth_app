%
% Author:         Farzad Farshchi <farzadfch@yahoo.com>
% Date:           Dec 2012
% Compiler:       MATLAB R2012b

function out = binvec2dec_my( bin )
    out = 0;
    for i=1:length(bin)
            out = out + bin(i)*2^(i-1);
    end
end