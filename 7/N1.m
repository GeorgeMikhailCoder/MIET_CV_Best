close all
clear
I = imread('123s.png');
I = rgb2gray(I);
imshow(I);
title('��������');

figure
I=imnoise(I,'salt & pepper',0.02);
imshow(I);
title('���');

% �������������������� ������
N=3;
J=im2double(I); % �������������� � double 0 � 1
J=exp(imfilter(log(J),ones(N,N),'replicate')./(N.^2));
J=im2uint8(J); % �������� �������������� � uint8 0 � 255
figure,imshow(J);
title('�������������������� ������');

% ������������������� ������
n=3;
J=im2double(I);% �������������� � double 0 � 1
J=n.^2./imfilter(1./(J+eps),ones(n,n),'replicate');
J=im2uint8(J); % �������� �������������� � uint8 0 � 255
figure,imshow(J);
title('������������������� ������');

% �������������������� ������
N=3;
J=imfilter(I,ones(N,N)/N^2,0);
figure,imshow(J);
title('�������������������� ������');

% ��������� ������
N=3;
J=imnoise(I,'salt & pepper',0.2);
figure;imshow(J);title('����� ����');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('��������� ������');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('��������� ������ �2');
J=medfilt2(J,[N N],'symmetric');
figure;imshow(J);title('��������� ������ �3');
