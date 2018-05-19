% Solution 2
clc;
clear all;
close all;
ima=imread('football.jpg');
% ma=imread(['C:\Users\dipankar1715\Downloads\island.jpeg']);
% [r,c]=sizer(ma)
figure(1)
% ima = ma(1:256, 1:256);

imshow(ima)                                % displaying the selected picture
% ima=gray2rgb(ima);
Grayima=rgb2gray(ima);                     % coversion of the image to gray scale
figure(2)
imshow(Grayima)                            % displaying the converted image

% y=blockproc(Grayima,[8 8],fun)           % dividing the picture into 8*8 blocks

Pic = im2double(Grayima);                  % converting picture


[rows, columns, numberOfColorBands] = size(Grayima)             % size of picture
                                               
Dctmat = dctmtx(8);                                             % Converting into 8*8 Discrete cosine trsansform matrix

% To preserve the top four rows we will apply the mask

mask=[1 1 1 1 1 1 1 1                                           
      1 1 1 1 1 1 1 1
      1 1 1 1 1 1 1 1
      1 1 1 1 1 1 1 1
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 ];

dctrans = @(block_struct) Dctmat * block_struct.data * Dctmat';
Blck = blockproc(Pic,[8 8],dctrans);


Blck1 = blockproc(Blck,[8 8],@(block_struct) mask .* block_struct.data);
figure(3)
imshow(Blck1)
invdctrasn = @(block_struct) Dctmat' * block_struct.data * Dctmat;
ima2 = blockproc(Blck1,[8 8],invdctrasn);
figure(4)
imshow(ima2)

% to preserve the first 2 rows

mask=[1 1 1 1 1 1 1 1
      1 1 1 1 1 1 1 1
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 ];

% dctrans = @(block_struct) D * block_struct.data * D';
% Blck = blockproc(Pic,[8 8],dctrans);
Blck2 = blockproc(Blck,[8 8],@(block_struct) mask .* block_struct.data);
figure(5)
imshow(Blck2)
invdctrans = @(block_struct) Dctmat' * block_struct.data * Dctmat;
ima3 = blockproc(Blck2,[8 8],invdctrans);
figure(6)
imshow(ima3)

% to preserve the first row

mask=[1 1 1 1 1 1 1 1
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 ];

Blck3 = blockproc(Blck,[8 8],@(block_struct) mask .* block_struct.data);
figure(7)
imshow(Blck3)
invdctrans = @(block_struct) Dctmat' * block_struct.data * Dctmat;
ima4 = blockproc(Blck3,[8 8],invdctrans);
figure(8)
imshow(ima4)