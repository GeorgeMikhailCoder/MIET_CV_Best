close all
I = imread('1.jpg');
I=rgb2gray(I);
imshow(I);
title('base')

figure
h=fspecial('average', [3 3]);
J=imfilter(I,h);
imshow(J);
title('average 3x3')

figure
h=fspecial('average',[5 5]);
J=imfilter(I,h);
imshow(J);
title('average 5x5')

figure
h=fspecial('average',[7 7]);
J=imfilter(I,h);
imshow(J);
title('average 7x7')

figure
h=[0 1 0; 1 -4 1; 0 1 0];
J=I-imfilter(I,h);
imshow(J);
title('Laplasian 1')

figure
h=[1 1 1; 1 -8 1; 1 1 1];
J=I-imfilter(I,h);
imshow(J);
title('Laplasian 2')
