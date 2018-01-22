%% This function locate coordinates of local maximas.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.

function [localmaximaXY] = localmaxXY(I)
    [rows, cols, ~] = size(I);
    localmaximaXY = zeros(nnz(I), 2);
    
    count = 1;
    for r = 1:rows
        for c = 1:cols
            if (I(r, c) ~= 0)
                localmaximaXY(count, 1) = r;
                localmaximaXY(count, 2) = c;
                
                count = count + 1;
            end
        end
    end
end