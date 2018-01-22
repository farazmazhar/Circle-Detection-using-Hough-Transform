%% This function generates a 2D gaussian mask of given size.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.

function [M] = my2DGaussian(S)
    M = zeros(S, S);
    M_mid = (S+1)/2; 
    SD = sqrt (-(S * S) / (2 * log10(1.0 / 255.0)));
    
    for i = 1:S
        for j = 1:S
            
            % Figuring out weight of the specific coordinate.
            x = i - M_mid;
            y = j - M_mid;
            
            M(i,j) = (1/(2 * pi * SD^2)) * exp(-((x^2 + y^2)/(2 * SD^2)));
        end
    end
    M = M/sum(M(:)); % Normalization.