function I3 = my_blending(I1, I2, method)
% A function to illustrate different blending techniques
% method can be ‘simple’ (just concatenating the two images) or ‘alpha’ (alpha blending)
% ‘pyramid’ is not implemented, but you can do it as as exercice
%
% Author: D. Sidibe, October 2016
% Master MAIA/MCV/VIBOT

if size(I1,1) ~= size(I2, 1) 
    error('input images must be same size');
end

if size(I1, 3) ~= 1
   I1 = double(rgb2gray(I1));
   I2 = double(rgb2gray(I2));
end

switch lower(method)
    case {'simple','add'}
        disp('Method is simple')
        I3 = zeros(size(I1));
        I3(:,1:ceil(size(I3,2)/2)) = I1(:,1:ceil(size(I1,2)/2));
        I3(:,ceil(size(I3,2)/2)+1:end) = I2(:,ceil(size(I1,2)/2)+1:end);
        
    case 'alpha'
        disp('Method is alpha blending')
        w = input('enter window size:');    % specified the window in which to used alpha blending
        if isempty(w)
            w = 5;                          % default value is 5
        end
        
        I3 = zeros(size(I1));
        I3(:,1:ceil(size(I3,2)/2)-w-1) = I1(:,1:ceil(size(I1,2)/2)-w-1);
        I3(:,ceil(size(I3,2)/2)+w+1:end) = I2(:,ceil(size(I1,2)/2)+w+1:end);
        % in the window region
        x1 = ceil(size(I3,2)/2)-w; x2 = ceil(size(I3,2)/2)+w; x = x1:x2;
        a = x./(x1-x2) -x2/(x1-x2); % alpha parameter
        a = repmat(a , size(I3,1), 1);
        I3(:, x1:x2) = a .* I1(:, x1:x2) + (1-a) .* I2(:, x1:x2);
        
    case 'pyramid'
        disp('Method is pyramid blending')
        
    otherwise
        disp('Unknown method.')
end
