%% This function will apply Laplacian Opeartor.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.

function [Ilap] = laplacian(I)
    LaplacianOperator = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
    
    I = double(I);
    
    % Convolving.
    Ilap = conv2(I, LaplacianOperator, 'same');
end