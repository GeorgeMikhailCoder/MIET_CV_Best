I = imread('SummerSun.jpg');
gr = rgb2gray(I);
percent = 20;

I(I==max(I,[],3))= I(I==max(I,[],3))...
    .*((100+percent)./100);

imshow(I);

