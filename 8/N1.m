close all
clear
I=imread('inc.png');
I = rgb2gray(I);
imshow(I);
PSF = fspecial('motion', 9, 50);
J=I;
J = imnoise(J,'salt & pepper',0.02);
J=imfilter(J,PSF);

figure
imshow(J);

J2 = deconvblind(J,PSF);
figure
imshow(J2);
title('?????????');

J2 = deconvwnr(J,PSF,0.02);
figure
imshow(J2);
title('?????');

J2 = deconvlucy(J,PSF);
figure
imshow(J2);
title('????');
