%% This function will perform accumulation in [r] space.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.

function [R, Irgb] = accumulationrspace(minr, maxr, Ithin, localMaximaXY, I, radiiThreshold)
    [LMX, ~, ~] = size(localMaximaXY);
    
    Irgb = I;
    
    for lmX = 1:LMX      
            R = zeros(maxr);
            
        for r = minr:maxr
            for theta = 1:360
                thetaRad = deg2rad(theta);                 
                x = localMaximaXY(lmX, 1) + r * cos(thetaRad);
                y = localMaximaXY(lmX, 2) + r * sin(thetaRad);

                x = ceil(x);
                y = ceil(y);


                if (x > 0 && x <= size(Ithin,1) && y > 0 && y <= size(Ithin,2))
                    R(r) = R(r) + Ithin(x, y);
                enda
            end
            if (R(r) > radiiThreshold)
               rX = localMaximaXY(lmX, 1);
               rY = localMaximaXY(lmX, 2);

               Irgb = insertShape(Irgb, 'circle', [rY rX r], 'color', 'red');
			   
			   % Uncomment following for spereate circles with approx. radius and centers.
%                figure,imshow(Irgb);
%                title(sprintf('A; %i, B; %i, Radius: %i, Intensity: %i', rX, rY, r, R(r)))
            end
        end
    end    
end