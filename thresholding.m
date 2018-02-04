%% This function will threshold am image.
%  * author: Faraz Mazhar, BCSF14M529
%  * source link: https://angeljohnsy.blogspot.com/2013/07/sobel-edge-detection-part-2.html
% ASSUMPTIONS:
% * None.

function [Ithreshold] = thresholding(I, threshold)
    Ithreshold = max(I,threshold);
    Ithreshold(Ithreshold==round(threshold))=0;

	% Both of them work fine.
%     Ithreshold = im2bw(Ithreshold);
    Ithreshold = mat2gray(Ithreshold);
end