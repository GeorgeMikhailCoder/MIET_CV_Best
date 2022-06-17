I = imread('SummerSun.jpg');
gr = rgb2gray(I);
percent = 20;


I = imadjust(I,[0 1],[0.1 1],5);


imshow(I);

