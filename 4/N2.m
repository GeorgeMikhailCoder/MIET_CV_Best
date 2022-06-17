close all
I = imread('house1.png');
I=rgb2gray(I);
I=imadjust(I,[0 1], [0 1],0.65);
imshow(I);


J = edge(I,'log');
figure
imshow(J);


J = edge(I,'canny');
figure
imshow(J);

J = hough(I);
figure
imshow(J);


% houghlies
% edge