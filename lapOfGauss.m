%% This function calculates and applies Laplacian of Guassian.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * Size is odd.

function [Imexican] = lapOfGauss(I, S)
    LoG = zeros(S, S);
    
    SD = 1.4;
    
    Imexican = zeros(size(I));
    
    for x = 1:S
        for y = 1:S
            LoG(x, y) = - (1/(pi * SD^4)) * (1 - (x^2 + y^2)/(2 * SD^2)) * exp(-(x^2 + y^2)/(2 * SD^2));
        end
    end
    
    LoG = LoG/(sum(sum(LoG)));
%     Imexican = convn(I, LoG);

    for i=1:size(I,1)-(S-1)
        for j=1:size(I,2)-(S-1)
            Imexican(i, j)=sum(sum(LoG.*I(i:i+(S-1),j:j+(S-1))));
        end
    end
end