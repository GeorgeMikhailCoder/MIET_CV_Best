close all
clear
I = imread('������1s.png');
I=rgb2gray(I);
imshow(I);
title('�������� ��������')

I1 = zeros(size(I));
porog = 150;
I1(I>porog) = I(I>porog);
figure
imshow(I1);
title('�����')

level = graythresh(I);
I2 = imbinarize(I,level);
figure
imshow(I2);
title('���')

I31 = watershed(I);
I31(I31>10)=30*I31(I31>10);
figure
imshow(I31);
title('����������')

% �������
I32 = imadjust(I,[0 1],[1 0],0.25);
I32 = watershed(I32);
I32(I32>10)=30*I32(I32>10);
figure
imshow(I32);
title('�������')

% ��������
I32=I;
h=fspecial('average', [3 3]);
I32=imfilter(I32,h);
I32 = watershed(I32);
I32(I32>10)=50*I32(I32>10);
figure
imshow(I32);
title('��������')

% ������� � ��������
I32 = imadjust(I,[0 1],[1 0],0.25);
h=fspecial('average', [3 3]);
I32=imfilter(I32,h);
I32 = watershed(I32);
I32(I32>10)=50*I32(I32>10);
figure
imshow(I32);
title('������� � ��������')
