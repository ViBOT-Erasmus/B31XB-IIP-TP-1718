function I2 = my_zooming(I1, newsize, method)
%
% A function to illustrate different interpolation techniques
% new size should be a 1x2 vector specifying th size of output image [m n]
% method can be ‘nn’ (nearest neighbour) or ‘bilinear’ (bilinear interpolation)
% or ‘bicubic’.
% Note that we use Matlab functions
%
% Author: D. Sidibe, October 2016
% Master MAIA/MCV/VIBOT

if size(newsize,2) ==1
   newsize(2) = newsize(1); 
end

switch lower(method)
    case {'nn','nearest'}
        disp('Method is Nearest Neighbour')
        I2 = imresize(I1, newsize, 'nearest');
        
    case 'bilinear'
        disp('Method is Bilinear interpolation')
        I2 = imresize(I1, newsize, 'bilinear');
        
    case 'bicubic'
        disp('Method is Bicubic interpolation')
        I2 = imresize(I1, newsize, 'bicubic');
        
    otherwise
        disp('Unknown method.')
end
