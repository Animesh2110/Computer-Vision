clc;
close all;
clear all;

Img1 = imread('C:\pics\Assignment\spidey.jpg');
Img2 = imread('C:\pics\Assignment\disney.jpg');
Img1 = im2double(Img1);
Img2 = im2double(Img2);
[r1,c1,d]=size(Img1)
Img1=Img1(1:160,1:280,:);

Img2=Img2(1:160,1:280,:);
imshow(Img1); title('scenery1');
figure;
imshow(Img2); title('scenery2');
figure;

Gfilt1 = imgaussfilt(Img1,2);              % applying the guassian filter
Greductn1 = imresize(Gfilt1,0.5);          % reducing the image
Gexpnsn1 = imresize(Gfilt1,[160,280]);     % doing the expansion

% Laplacian Pyramids for 1st image

Lap1=Img1-Gexpnsn1;
imshow(Lap1);title('Laplacian pyramid for image 1');
figure;

Gfilt2 = imgaussfilt(Greductn1,2);
Greductn2 = imresize(Gfilt2,0.5);
Gexpnsn2=imresize(Gfilt2,[80,140]);
Lap12=Greductn1-Gexpnsn2;
imshow(Lap12);
figure;

Gfilt3 = imgaussfilt(Greductn2,2);
Greductn3 = imresize(Gfilt3,0.5); 
Gexpnsn3=imresize(Gfilt3,[40,70]);
Lap13=Greductn2-Gexpnsn3;
imshow(Lap13);
figure;

gfilt1 = imgaussfilt(Img2,2);
greductn1 = imresize(gfilt1,0.5); 
gexpnsn1=imresize(gfilt1,[160,280]);

% Laplacian Pyramids for 2nd image

Lap2=Img2-gexpnsn1;
imshow(Lap2);title('Laplacian pyramid for image 2');
figure;

gfilt2 = imgaussfilt(greductn1,2);
greductn2 = imresize(gfilt2,0.5); 
gexpnsn2=imresize(gfilt2,[80,140]);
Lap21=greductn1-gexpnsn2;
imshow(Lap21);
figure;

gfilt3 = imgaussfilt(greductn2,2);
greductn3 = imresize(gfilt3,0.5); 
gexpnsn3=imresize(gfilt3,[40,70]);
Lap22=greductn2-gexpnsn3;
imshow(Lap22);
figure;

% Creating the Binary mask and applying it on the image

Binmask1=ones(160,280);
for i=1:160
    for j=1:140
        Binmask1(i,j)=0;
    end
end
imshow(Binmask1);
figure;
Binmask2=imcomplement(Binmask1);
imshow(Binmask2);

% Construction of gaussian pyramids of the binary masks

Gmask1=imgaussfilt(Binmask1,2);
Gmask11=imresize(Gmask1,0.5);
Gmask1=imresize(Gmask11,[160,280]);
Gmask2=imgaussfilt(Gmask11,2);
Gmask21=imresize(Gmask2,0.5);
Gmask2=imresize(Gmask21,[80,140]);
Gmask3=imgaussfilt(Gmask21,2);
Gmask31=imresize(Gmask3,0.5);
Gmask3=imresize(Gmask3,[40,70]);

% Concatenating for 3-D image

Gmask1=cat(3,Gmask1,Gmask1,Gmask1);
Gmask2=cat(3,Gmask2,Gmask2,Gmask2);
Gmask3=cat(3,Gmask3,Gmask3,Gmask3);

gmask1=imgaussfilt(Binmask2,2);
gmask11=imresize(gmask1,0.5);
gmask1=imresize(gmask11,[160,280]);

gmask2=imgaussfilt(gmask11,2);
gmask21=imresize(gmask2,0.5);
gmask2=imresize(gmask21,[80,140]);

gmask3=imgaussfilt(gmask21,2);
gmask31=imresize(gmask3,0.5);
gmask3=imresize(gmask3,[40,70]);

gmask1=cat(3,gmask1,gmask1,gmask1);
gmask2=cat(3,gmask2,gmask2,gmask2);
gmask3=cat(3,gmask3,gmask3,gmask3);

% Multiplying the laplacian images with their respective guassian binary masks

LapBinmasking11=times(Gmask1,Lap1);
LapBinmasking12=times(Gmask2,Lap12);
LapBinmasking13=times(Gmask3,Lap13);

LapBinmasking21=times(gmask1,Lap2);
LapBinmasking22=times(gmask2,Lap21);
LapBinmasking23=times(gmask3,Lap22);

% Addition of the weighted pyramids

Weipyr1=LapBinmasking21+LapBinmasking11;
Weipyr2=LapBinmasking22+LapBinmasking12;
Weipyr3=LapBinmasking23+LapBinmasking13;

% Reconstruction of the blended image

Weipyr3=imresize(Weipyr3,[80,140]);
Weipyr2=Weipyr2+Weipyr3;
Weipyr2=imresize(Weipyr2,[160,280]);
Weipyr1=Weipyr2+Weipyr1;
Weipyr1 = Weipyr1 + 0.2 ;                    % Increasing the brightness
imshow(Weipyr1); title('Blended Image');