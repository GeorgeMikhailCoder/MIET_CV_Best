close all
clear
I = imread('123s.png');
I = rgb2gray(I);
imshow(I);
title('»сходное');

figure
I=imnoise(I,'salt & pepper',0.02);
imshow(I);
title('Ўум');

% среднегеометрический фильтр
N=3;
J=im2double(I); % преобразование к double 0 Ц 1
J=exp(imfilter(log(J),ones(N,N),'replicate')./(N.^2));
J=im2uint8(J); % обратное преобразование к uint8 0 Ц 255
figure,imshow(J);
title('среднегеометрический фильтр');

% среднегармонический фильтр
n=3;
J=im2double(I);% преобразование к double 0 Ц 1
J=n.^2./imfilter(1./(J+eps),ones(n,n),'replicate');
J=im2uint8(J); % обратное преобразование к uint8 0 Ц 255
figure,imshow(J);
title('среднегармонический фильтр');

% среднеарифметический фильтр
N=3;
J=imfilter(I,ones(N,N)/N^2,0);
figure,imshow(J);
title('среднеарифметический фильтр');

% медианный фильтр
N=3;
J=imnoise(I,'salt & pepper',0.2);
figure;imshow(J);title('ћного шума');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('медианный фильтр');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('медианный фильтр х2');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('медианный фильтр х3');
