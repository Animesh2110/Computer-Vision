clc;
clear all;
close all;

A = imread('C:\Users\myspa\Desktop\folder\1_1.tif');
figure;
imshow(A)
title('a)Original Ultra sound image')
figure;
A=decorrstretch(A);
C=medfilt2(A);
imshow(C);
t = (imresize(C,[256 256]));% +50.*uint8(t);
imshow(t);
title('b)Preprocessed Ultra sound image');
h = impoint;
p = getPosition(h);
h1 = impoint;
p1 = getPosition(h1);
rad = abs(p1(2)- p(2))/2;
centre = [ (p1(1)+p(1))/2 , (p(2)+p1(2))/2];
m = createCirclesMask(t,centre,rad);
m = imresize(m,.5);
phi_init = m;
figure;
imshow(m);
title('c)Mask/ Initial Contour');
figure;
imshow(m);
title('d)Nerve segementation on original image');
I = (imresize(C,[256 256]));
I = imresize(I,.5);
[seg,phi] = localized_seg(I,phi_init,300);  %-- run segmentation
figure;
imshow(seg);
title('d)Final contour');
cnt=0;



