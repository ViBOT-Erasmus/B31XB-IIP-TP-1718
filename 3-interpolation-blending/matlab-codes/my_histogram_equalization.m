function im2 = my_histogram_equalization(im)
% 
% A function to illustrate different blending techniques
% Of course, a function is already given in Matlab (histeq)
% but, this one just illustrate the concept
%
% Author: D. Sidibe, October 2016
% Master MAIA/MCV/VIBOT


if size(im, 3) ~= 1
    im = rgb2gray(im);
    im = uint8(im);
end

h = imhist(im);         % compute histogram
h = h / sum(h);         % normalize h
my_cdf = zeros(length(h));  % compute cdf
for k=1:length(h)
    my_cdf(k) = sum(h(1:k));
end

im2 = zeros(size(im));  % apply intensity transformation
for i=1:size(im,1)
    for j=1:size(im,2)
        im2(i,j) = my_cdf(im(i,j));
    end
end
im2 = round(255*im2);
im2 = uint8(im2);

% % another option: without the loops over pixels
% h = imhist(im);
% h = h/sum(h);
% my_cdf = zeros(length(h)); 
% for k=1:length(h)
%     my_cdf(k) = sum(h(1:k));
% end
% im2 = uint8( round( 255 * my_cdf(im) ) );

