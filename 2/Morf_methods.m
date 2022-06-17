close all
I = imread('mlp1.jpg');
I=rgb2gray(I);

% 1. Выполните эрозию, дилатацию и 
% выполните алгоритм морфологического градиента. 
% 2. Сделайте выводы. В соответствии с чем 
% надо выбирать примитив? 3. Выполните 
% обработку изображения с помощью размыкания, 
% замыкания, морфологического сглаживания. 
% А также преобразований 
% top-hat, bottom-hat? 4. По каждому 
% преобразованию сделайте выводы. Сформируйте отчёт 
% (аналогично прошлым дз). Операции, которые 
% могут оказаться полезны: strel, imclose, 
% imdilate, imerode, imsubtract, imopen. *

% strel - создаёт примитив
% imdilate - дилатация
% imerode - эрозия
% imclose - замыкание
% imopen - размыкание
% imsubstruct - вычитание множеств

S = strel('square',5);
T = ["Base" "Erosion" "Dilate" ...
    "Gradient" "Close" "Open"...
    "smoothing" "top-hat" "bottom-hat"];
close all
I1 = I;
% subplot(3,3,1);
figure
imshow(I1);
title(T(1));

% эрозия
I2 = imerode(I,S);
% subplot(3,3,2);
figure
imshow(I2);
title(T(2));

% дилатация
I3 = imdilate(I,S);
% subplot(3,3,3);
figure
imshow(I3);
title(T(3));

% градиент
I4 = imdilate(I,S)-imerode(I,S);
% subplot(3,3,4);
figure
imshow(I4);
title(T(4));

% замыкание
I5 = imclose(I,S);
% subplot(3,3,5);
figure
imshow(I5);
title(T(5));

% размыкание
I6 = imopen(I,S);
% subplot(3,3,6);
figure
imshow(I6);
title(T(6));

% сглаживание
I7 = imclose(imopen(I,S),S);
% subplot(3,3,7);
figure
imshow(I7);
title(T(7));

% top-hat
I8 = I-imopen(I,S);
% subplot(3,3,8);
figure
imshow(I8);
title(T(8));

% buttom-hat
I9 = imclose(I,S)-I;
% subplot(3,3,9);
figure
imshow(I9);
title(T(9));
