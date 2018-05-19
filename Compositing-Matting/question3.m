clc;
clear all;
close all;

Im1=imread('football.jpg');
figure(1)
imshow(Im1)
[r1, c1]= size(Im1)             % size of picture

Im2=imread('coloredChips.png');
figure(2)
imshow(Im2)
[r2, c2] = size(Im2)             % size of picture

minval=min([r1,r2,c1,c2])
C=minval/2

Im1square=Im1(1:minval,1:minval);
Im2square=Im2(1:minval,1:minval);
figure(3)
imshow(Im1square)
figure(4)
imshow(Im2square)


% 
alpmat=zeros(minval,minval);
siz=size(alpmat)
figure(5)
imshow(alpmat)

cntr=size(alpmat)/2;
 y=linspace(1,0,C);                   % generates C number of points linearly spaced between 1,0
 for i=1:minval
    for j=1:minval
                         
        if pdist([i,j;cntr])<=(C/2);
            alpmat(i,j)=1;
        else if pdist([i,j;cntr]) >= (C);
            alpmat(i,j)=0;
            else 
                r = round((pdist([i,j;cntr])))  ;         
                alpmat(i,j)=y(r) ;
%                 (((C/4)/pdist([i,j;cntr],)));
            end
        end
    end
 end
figure(6)
imshow(alpmat)

for i=1:minval
    for j=1:minval
        fin(i,j)=(1-alpmat(i,j))*Im2square(i,j) + alpmat(i,j)*Im1square(i,j);
    end
end

figure(7)
imshow(fin)