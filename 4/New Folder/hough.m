function [h, theta, rho] = hough(f, dtheta, drho) 
% '/.HOUGH Hough transform. 
% °/. [H, THETA, RHO] = HOUGH(F, DTHETA, DRHO) computes the Hough 
% °/0 transform of the image F. DTHETA specifies the spacing (in 
% °/o degrees) of the Hough transform bins along the theta axis. DRHO 
% °/o specifies the spacing of the Hough transform bins along the rho 
% °/o axis. H is the Hough transform matrix. It is NRHO-by-NTHETA, 
% '/. where NRHO = 2*ceil(norm(size(F))/DRH0) - 1, and NTHETA = 
% e/. 2*ceil(90/DTHETA). Note that if 90/DTHETA is not an integer, the 
% °/o actual angle spacing will be 90 / ceil (90/DTHETA) . 
% °/o 
% '/, THETA is an NTHETA-element vector containing the angle (in 
% °/o degrees) corresponding to each column of H. RHO is an 
% °/o NRHO-element vector containing the value of rho corresponding to 
% % each row of H. 
% °/o [H, THETA, RHO] = HOUGH(F) computes the Hough transform using 
% °/o DTHETA = 1 and DRHO = 1. 

if nargin < 3 
drho = 1; 
end 
if nargin < 2 
dtheta = 1; 
end 
f = double(f); 
[M,N] = size(f); 
theta = linspace(-90, 0, ceil(90/dtheta) + 1); 
theta = [theta -fliplr(theta(2:end - 1))]; 
ntheta = length(theta); 
D = sqrt((M - 1)^2 + (N - 1)^2); 
q = ceil(D/drho); 
nrho = 2*q - 1; 
rho = linspace(-q*drho, q*drho, nrho); 
[x, y, val] = find(f); 
x=x-1;y=y-1; 
% °/e Initialize output, 
h = zeros(nrho, length(theta)); 
% °/o To avoid excessive memory usage, process 1000 nonzero pixel 
% e/e values at a time, 
for k = 1:ceil(length(val)/1000) 
first = (k - 1)*1000 + 1; 
last = min(first+999, length(x)); 
x_matrix = repmat(x(first:last), 1, ntheta); 
y_matrix = repmat(y(first:last), 1, ntheta); 
val_matrix = repmat(val(first:last), 1, ntheta); 
theta_matrix = repmat(theta, size(x_matrix, 1), 1)*pi/180; 
rho_matrix = x_matrix.*cos(theta_matrix) + ... 
y_matrix.*sin(theta_matrix); 
slope = (nrho - 1)/(rho(end) - rho(1)); 
rho_bin_index = round(slope*(rho_matrix - rho(1)) + 1); 
theta_bin_index = repmat(1:ntheta, size(x_matrix, 1), 1); 
% °/0 Take advantage of the fact that the SPARSE function, which 
% °/e constructs a sparse matrix, accumulates values when input 
% Ó, indices are repeated. That's the behavior we want for the 
% Ó, Hough transform. We want the output to be a full (nonsparse) 
% % matrix, however, so we call function FULL on the output of 
% Ó. SPARSE. 
h = h + full(sparse(rho_bin_index(:), theta_bin_index(:), ... 
val_matrix(:), nrho, ntheta)); 
end 
