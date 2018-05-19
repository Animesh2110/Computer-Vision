clc;
clear all;
close all;

a=imread('C:\Users\myspa\Desktop\folder\1_1.tif');
m=imread('C:\Users\myspa\Desktop\folder\1_1_mask.tif');
figure;
imshow(a);
title('a)Original Ultra sound image');
figure;
imshow(m);
title('b)Mask/ Initial Contour');
figure;
A=decorrstretch(a);
imshow(A);
title('c)Decorelated image')
C=medfilt2(A);
figure;
imshow(C);
title('d)Prepocessed Image');
bw=activecontour(C,m,300,'edge');
figure;
imshow(bw);
title('e)Final contour')
BWoutline = bwperim(bw);
thickOutlines = imdilate(BWoutline, true(3));
SegoutR = A;
SegoutG = A;
SegoutB = A;
%now set yellow, [255 255 0]
SegoutR(thickOutlines) = 0;
SegoutG(thickOutlines) = 255;
SegoutB(thickOutlines) = 0;
SegoutRGB = cat(3, SegoutR, SegoutG, SegoutB);
%Segout(BWoutline) = 255; 
figure;
imshow(SegoutRGB);
title('f)Nerve segementation on original image ');


