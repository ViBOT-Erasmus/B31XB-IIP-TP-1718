%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Introduction to image processing 
%%% Mojdeh Ratgoo, Desire Sidibe


% Read 'lena-grey.bmp' image from images folder
% imread
%-------------------------------------------------------------------------%
img_path = 'images/'; 
lena_im = imread(fullfile(img_path, 'lena-grey.bmp'));

% Show the loaded image, pause and then change the colormap
% imshow, colormap
%-------------------------------------------------------------------------%
figure; imshow(lena_im);
pause; 
colormap('jet')


% show the size and the type of the loaded image
% size, iminfo
%-------------------------------------------------------------------------%
disp 'image size' 
size(lena_im)

imfinfo(fullfile(img_path, 'lena-grey.bmp'))


% load and show the 'vibot-color.jpg' image
%-------------------------------------------------------------------------%
vibot_im = imread(fullfile(img_path, 'vibot-color.jpg'));
figure ; imshow(vibot_im); 

% show each channel and the gray channel of the color image in one figure
rgb2gray, figure, subplot
%-------------------------------------------------------------------------%
figure; 
subplot(221); imshow(vibot_im(:,:,1)); 
subplot(222); imshow(vibot_im(:,:,2)); 
subplot(223); imshow(vibot_im(:,:,3)); 
subplot(224); imshow(rgb2gray(vibot_im)); 

% What is the type of lena-grey image, change this type to float
% im2double
%-------------------------------------------------------------------------%
lena_double = im2double(lena_im); 

% Save the new image in images folder with the name 'lena-float.png'
% imwrite
%-------------------------------------------------------------------------%
imwrite( lena_double, fullfile(img_path, 'lena_float.png')); 

% show the histogram of the lena-grey image 
% imhist 
%-------------------------------------------------------------------------%
%figure ; imhist (lena_double);
[x,val] = imhist(lena_double);


% Create your own function which calculate the histogram of the image 
%-------------------------------------------------------------------------%
lena_vec = lena_double(:);
min_val = min(lena_vec);
max_val = max(lena_vec); 

lena_double = lena_double  ./ (max_val) ;
lena_vec = lena_double(:);
x_count = zeros([1, 256]); 
x_range = linspace(0, 1, 256); 
x_count(1) = length(find(lena_vec <= x_range(1)));

for i = 2 : length(x_range)
    val2= find(lena_vec <= x_range(i));
    val3 = find(lena_vec <= x_range(i-1));
    x_count(i) = length(val2) - length(val3);
end
x_range = x_range'; 
x_count = x_count'; 