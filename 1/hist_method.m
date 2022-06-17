I = imread('sun1.jpg');
I=rgb2gray(I);
imshow(I);
figure
imhist(I);
figure
I=histeq(I,256);
imhist(I);
figure
imshow(I);
