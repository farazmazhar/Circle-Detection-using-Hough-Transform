%% This function convolves a given image.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * I is an image. (8-bit image)
%  * M is a mask. (2D Matrix / Normalized / 'n' x 'n' / 'n' is odd)

function [I] = my2DConvolution(I,M)
    [img_r, img_c] = size(I);
    [msk_r, msk_c] = size(M);
    msk_mid = (msk_r + 1)/2;
        
    for i = 1:img_r
        for j = 1:img_c
            conv = 0;
            
            for m = 1:msk_r
                img_r_msk = i-msk_mid+m;                   
                
                % Checking row borders.
                if img_r_msk < 1
                    % Mirroring rows on the left.
                    img_r_msk = img_r_msk + ((-2 * img_r_msk) + 1);
                elseif img_r_msk > img_r
                    % Mirroring rows on the right.
                    img_r_msk = img_r_msk - ((2 * (img_r_msk - img_r)) + 1);
                end
                
                for n = 1:msk_c
                    img_c_msk = j-msk_mid+n;
                    
                    % Checking column borders.
                    if img_c_msk <= 0
                        % Mirroring columns on the top.
                        img_c_msk = img_c_msk + ((-2 * img_c_msk) + 1);
                    elseif img_c_msk > img_c
                        % Mirroring rows on the right.
                        img_c_msk = img_c_msk - ((2 * (img_c_msk - img_c)) + 1);
                    end
                    
                    % Applying mask on the apt pixels.
                    conv = conv + (I(img_r_msk, img_c_msk) * M(msk_r-m+1, msk_c-n+1));
                end
            end
            
            I(i, j) = conv;
        end
    end
    