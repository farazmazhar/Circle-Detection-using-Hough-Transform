%% This function will perform accumulation in [a, b] space.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.

function [A] = accumulation(minr, maxr, magnitude, gradient)
    [rows, cols, ~] = size(magnitude);
    
    A = zeros(rows, cols);
%     A3 = zeros(rows, cols, maxr);

    for row = 1:rows
        for col = 1:cols
            for r = minr:maxr
                a = row - (r * cos(gradient(row, col)));
                b = col - (r * sin(gradient(row, col)));
                c = row + (r * cos(gradient(row, col)));
                d = col + (r * sin(gradient(row, col)));

%                 b = a * tan(gradient(row, col)) - row * tan(gradient(row, col)) + col;

                a = ceil(a);
                b = ceil(b);
                c = ceil(c);
                d = ceil(d);

                if (a > 0 && a <= rows && b > 0 && b <= cols)
                    A(a, b) = A(a, b) + (magnitude(row, col)/r);                    
%                     A3(a, b, r) = A(a, b, r) + (magnitude(row, col)/r);
                end
                if (c > 0 && c <= rows && d > 0 && d <= cols)
                    A(c, d) = A(c, d) + (magnitude(row, col)/r);
%                     A3(c, d, r) = A(c, d, r) + (magnitude(row, col)/r);
                end
            end
        end
    end
    figure, imshow(A);
    A = lapOfGauss(A, 17);
    A(A < 1) = 0;
end