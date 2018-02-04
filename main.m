%% Circle detection using hough transfomration
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * Images are in grayscale.

I = imread('circle.png');
[r, c, d] = size(I);

if (d ~= 1)
    I = rgb2gray(I);
end

GaussSize = 3; % Adjust this for the size of Guassian mask. // Mask size should be odd and >= 3.
threshold = 200; % Adjust threshold for Sobel edge detection here.
radiiThreshold = 200; % Adjust this threshold for radius calculation.

% Radii for unknown or set both with same value for known. // r48 outer rim
minr = 10;
maxr = 100;

% Connectivity for finding local maxima. (Default is 8)
% Acceptable values are 1, 4, 6, 8, 18, and 26.
conn = 26; 

% Generating Gaussian Mask.
Mgauss = my2DGaussian(GaussSize);

% Convolving Guassian Mask for smoothing for noise reduction.
Iconv = my2DConvolution(I, Mgauss);

% Sobel filtering for edge detection.
[Isobel, gradient] = sobelFilter(Iconv);

% Thresholding.
Iedged = thresholding(Isobel, threshold);

% Skeletonization
Ithin = bwmorph(Iedged, 'skel', Inf);

% Accumulation in (a, b) space for unknown radius. 
% Give same value to minr and maxr for known radius.
[A] = accumulation(minr, maxr, Ithin, gradient);

% Finding local maxima.
localMaxima = imregionalmax(A, conn);
Amax = max(max(A));
Aglobalmax = localMaxima;

localMaximaXY = localmaxXY(Aglobalmax);

% Accumulation in (r) space and then draws circles on the image.
[R, Irgb] = accumulationrspace(minr, maxr, Ithin, localMaximaXY, I, radiiThreshold);

% Draw circles on the input image.
% rgb = insertShape(I, 'circle', [49 49 50]);

% [x, y, z] = ind2sub(size(A), find(A));
% plot3(x, y, z, 'k.');

% Original image with detected circles.
figure,imshow(Irgb);