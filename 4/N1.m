close all
I = imread('1.jpg');
rgb2gray(I);
imshow(I);
% [H theta rho] = hough(I,0.5);
H = hough(I);
imshow(H);
axis on
axis normal
xlabel('theta');
ylabel('rhotheta');
% [r c]=houghpeaks(H,5);
J =houghpeaks(H,5);

hold on
plot(theta(c), rho(r), 'linestyle', 'none', ... 
'marker', 's', 'color', 'w') 
f=I;
lines = houghlines (f, theta, rho, r, c);
figure, imshow(f) , hold on 

for k = 1 :length(lines) 
xy(k) = [lines(k).point1 ; lines(k).point2]
x = lines(k).point2;
y = lines(k).point1;
plot(x,y);
plot(x(:,2), y(:,1), 'LineWidth', 4, 'r');
plot(xy(:,2), xy(:,1), 'LineWidth', 4, 'r');
end 
