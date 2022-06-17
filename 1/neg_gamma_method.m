close all
I = imread('sun1.jpg');
I=rgb2gray(I);
imshow(I);
I=imadjust(I,[0 1] , [1 0], 1);
% I=im2double(I);
% I = 2.*log(1+I);
% I=im2uint8(I);
% B = (I>150);
% B=B.*(I<205);
% B=logical(B);
% I(B)=I(B)+50;
figure
imshow(I);