%% This function plots circles.
%  * author: Faraz Mazhar, BCSF14M529
% ASSUMPTIONS:
%  * None.


%e
%r= desired radius
%x = x coordinates of the centroid
%y = y coordinates of the centroid
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);