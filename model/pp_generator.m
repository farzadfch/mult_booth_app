%
% Author:         Farzad Farshchi <farzadfch@yahoo.com>
% Date:           Dec 2012
% Compiler:       MATLAB R2012b

function out = pp_generator( part_x, y )
    switch( part_x )
        case 0
            out = 0;
        case 1
            out = y;
        case 2
            out = y;
        case 3
            out = 2*y;
        case 4
            out = -2*y;
        case 5
            out = -y;
        case 6
            out = -y;
        case 7
            out = 0;
    end
end