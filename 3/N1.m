 I=imread('SummerSun.jpg');
 close all
 imshow(I);
 
% ������:
% �������� ��������
% ��������� ������� ����� ��������
% ��������� �������� ����� ��������
 
[R, G, B]=im2rgb(I);
Y = rgb2gray(I);

% ���������� �������� ������
R1=R;
G1=G;
B1=B;



figure
imshow(R)

% ������� � �������
R=imadjust(R,[0 1] , [1 0], 1); 
figure
imshow(R)

% ��������� ��������
h=[0 1 0; 1 -4 1; 0 1 0];
R=R-imfilter(R,h);
figure
imshow(R)

% ��������� ������� ��������, ���������� ������� ��������
R=imadjust(R,[0 1] , [0 1], 0.3);
figure
imshow(R)

% ����������� � �������
R=imadjust(R,[0 1] , [1 0], 1);
figure
imshow(R)

% ���������� ������� ��������
R=imadjust(R,[0 1] , [0 1], 0.7);
figure
imshow(R)

R=(R+R1);

% ��������� ������� ������ � �������
B=imadjust(B,[0 1] , [0 1], 0.8);
G=imadjust(G,[0 1] , [0 1], 0.6);
figure
I = rgb2im(R,G,B);
imshow(I);

% ������� ��������� ��������
h=[0 1 0; 1 -4 1; 0 1 0];
R1=R-imfilter(R,h);
G1=G-imfilter(G,h);
B1=B-imfilter(B,h);
J = rgb2im(R1,G1,B1);
figure
imshow(J);

% ��������� �������� ����� �������� (������ �� ����������)
h=[0 1 0; 1 -4.2 1; 0 1 0];
R=R-imfilter(R,h);
G=G-imfilter(G,h);
B=B-imfilter(B,h);
I = rgb2im(R,G,B);
figure
imshow(I);
