%% This function implements Sobel filters on an image by convolution.
%  * author: Faraz Mazhar, BCSF14M529
%  * source link: https://angeljohnsy.blogspot.com/2013/07/sobel-edge-detection-part-2.html
% ASSUMPTIONS:
%  * Image is grayscale.
%  * Image is smoothed or has insignificant ammont of noise.

function [sobelmerged, gradient] = sobelFilter(I)
    Gx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % Vertical Sobel filter mask.
    Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % Horizontal Sobel filter mask.

    I = double(I);
    sobelmerged = zeros(size(I));
    gradient = zeros(size(I));
    
    % Convolution for magnitude and gradient.
    for i=1:size(I,1)-2
        for j=1:size(I,2)-2
            % Gradient operations
            Ix=sum(sum(Gx.*I(i:i+2,j:j+2)));
            Iy=sum(sum(Gy.*I(i:i+2,j:j+2)));

            % Magnitude of vector
            sobelmerged(i+1,j+1)=sqrt(Ix.^2+Iy.^2);
            % Direction map
            gradient(i+1,j+1) = atan(Ix/Iy);
        end
    end
    
    % Convolving.
%     Ix = conv2(I, Gx); % Sobel vertical.
%     Iy = conv2(I, Gy); % Sobel horizontal.

%     Ix = edge(I,'Sobel', 185, 'horizontal');
%     Iy = edge(I,'Sobel', 185, 'vertical');
%     
%     sobelmerged=sqrt(Ix.^2+Iy.^2);
%     sobelmerged = edge(I,'Sobel');
%     gradient = atan(Ix./Iy); % Returns in interval [-pi/2, pi/2].
%     gradient = edge(I,'Sobel', 'both');
%     atan2 interval = [-pi,pi].
%     [sobelmerged, ~] = imgradient(I, 'sobel');
%     gradient = deg2rad(gradient);
     
end