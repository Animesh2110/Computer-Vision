clc;
clear all;
close all;


% ker=[1 4 6 4 1]
% k=(1/16)*ker
q=(sqrt(5))/2;
orgimage=imread('C:\pics\Assignment\landscape.jpg');             % original image
figure(1);
imshow(orgimage)
orgimage1=im2double(orgimage);                              
orgimage1=orgimage1(1:800,1:800,:);                              % resizing the image
figure(2);
imshow(orgimage1)

lev1=imgaussfilt(orgimage1,q);                                   % guassian reduction 1 = level 1
relev1=imresize (lev1,0.5);
figure(3);
imshow(relev1)

lev2=imgaussfilt(relev1,q);                                      % guassian reduction 2 = level 2
relev2=imresize (lev2,0.5);
figure(4);
imshow(relev2)

lev3=imgaussfilt(relev2,q);                                      % guassian reduction 3 = level 3
relev3=imresize (lev3,0.5);
figure(5);
imshow(relev3)

lev4=imgaussfilt(relev3,q);                                      % guassian reduction 4 = level 4
relev4=imresize (lev4,0.5);
figure(6);
imshow(relev4)

lev5=imgaussfilt(relev4,q);                                      % guassian reduction 5 = level 5
relev5=imresize (lev5,0.5);
figure(7);
imshow(relev5)