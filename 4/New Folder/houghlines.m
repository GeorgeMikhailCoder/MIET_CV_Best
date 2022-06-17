function lines = houghlines(f,theta,rho,rr,cc,fillgap,minlength) 
% '/oHOUGHLINES Extract line segments based on the Hough transform. 
% °/, LINES = HOUGHLINES(F, THETA, RHO, RR, CC, FILLGAP, MINLENGTH) 
% °/o extracts line segments in the image F associated with particular 
% e/o bins in a Hough transform. THETA and RHO are vectors returned by 
% °/e function HOUGH. Vectors RR and CC specify the rows and columns 
% °/e of the Hough transform bins to use in searching for line 
% °/o segments. If HOUGHLINES finds two line segments associated with 
% °/o the same Hough transform bin that are separated by less than 
% e/e FILLGAP pixels, HOUGHLINES merges them into a single line 
% °/« segment. FILLGAP defaults to 20 if omitted. Merged line 
% °/e segments less than MINLENGTH pixels long are discarded. 
% 7, MINLENGTH defaults to 40 if omitted. 
% У, 
% 7o LINES is a structure array whose length equals the number of 
% 7, merged line segments found. Each element of the structure array 
% 7, has these fields: 
% 7. 
% У, pointl End-point of the line segment; two-element vector 
% Ус point2 End-point of the line segment; two-element vector 
% % length Distance between pointl and point2 
% °/o theta Angle (in degrees) of the Hough transform bin 
% °/e rho Rho-axis position of the Hough transform bin 
if nargin < 6 
fillgap = 20; 
end 
if nargin < 7 
minlength = 40; 
end 
l=1;
numlines = 0; lines = struct; 
for k = l:length(rr) 
rbin = rr(k); cbin = cc(k); 
% °/o Get all pixels associated with Hough transform cell. 
[r, c] = houghpixels(f, theta, rho, rbin, cbin); 
if isempty(r) 
continue 
end 
% 1 Функция В = inv(A) вычисляет обратную матрицу для А. 
% Глава 10. Сегментация изображений 
% Rotate the pixel locations about A,1) so that they lie 
% approximately along a vertical line. 
omega = (90 - theta(cbin)) * pi / 180; 
T = [cos(omega) sin(omega); -sin(omega) cos(omega)]; 
xy = [r - 1 c - 1] * T; 
x = sort(xy(:,1)); 
% Find the gaps larger than the threshold. 
diff_x = [diff(x); Inf]; 
idx = [0; find(diff_x > fillgap)] ; 
for p = 1:length(idx) - 1 
xl = x(idx(p) + 1); x2 = x(idx(p + 1)); 
linelength = x2 - xl; 
if linelength >= minlength 
point1 = [xl rho(rbin)]; point2 = [x2 rho(rbin)]; 
% °/o Rotate the end-point locations back to the original 
% °/o angle. 
Tinv = inv(T); 
point1 = point1 * Tinv; point2 = point2 * Tinv; 
numlines = numlines + 1; 
lines(numlines).point1 = point1 + 1; 
lines(numlines).point2 = point2 + 1; 
lines(numlines).length = linelength; 
lines(numlines).theta = theta(cbin); 
lines(numlines).rho = rho(rbin); 
end 
end 
end 

