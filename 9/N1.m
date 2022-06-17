function res = N1(I)

if(nargin==0)
    I=imread('поезд.png');
    I=rgb2gray(I);
end

figure
imshow(I);
title('Base');

figure
corners = detectHarrisFeatures(I);
imshow(I);hold on
plot(corners);
title('Harris');


figure
corners = detectFASTFeatures(I);
imshow(I);hold on
plot(corners.selectStrongest(50));
title('Fast');
hold off
end

