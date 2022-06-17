function [r, c, hnew] = houghpeaks(h, numpeaks, threshold, nhood) 
% 10.2. Обнаружение линий с помощью преобразования Хафа 
% °/oHOUGHPEAKS Detect peaks in Hough transform. 
% '/. [R, C, HNEW] = HOUGHPEAKSCH, NUMPEAKS, THRESHOLD, NHOOD) detects 
% 7o peaks in the Hough transform matrix H. NUMPEAKS specifies the 
% °/o maximum number of peak locations to look for. Values of H below 
% °/o THRESHOLD will not be considered to be peaks. NHOOD is a 
% °/0 two-element vector specifying the size of the suppression 
% 7o neighborhood. This is the neighborhood around each peak that is 
% °/o set to zero after the peak is identified. The elements of NHOOD 
% °/o must be positive, odd integers. R and С are the row and column 
% °/0 coordinates of the identified peaks. HNEW is the Hough transform 
% °/o with peak neighborhood suppressed. 
% У. 
% °/o If NHOOD is omitted, it defaults to the smallest odd values >= 
% '/. size(H)/50. If THRESHOLD is omitted, it defaults to 
% °/o 0.5*max(H(:)) . If NUMPEAKS is omitted, it defaults to 1. 
if nargin < 4 
nhood = size(h)/50; 
% Make sure the neighborhood size is odd. 
nhood = max(2*ceil(nhood/2) + 1, 1); 
end 
if nargin < 3 
threshold = 0.5 * max(h(:)); 
end 
if nargin < 2 
numpeaks = 1; 
end 
l=1;
done = false; 
hnew = h; r = [] ; c = [] ; 
while ~done 
[p, q] = find(hnew == max(hnew(:))); 
p = p(l); q = q(l); 
if hnew(p, q) >= threshold 
r(end + 1) = p; c(end + 1) = q; 
% 7o Suppress this maximum and its close neighbors. 
p1 = p - (nhood(l) - l)/2; p2 = p + (nhood(l) - l)/2; 
q1 = q - (nhood(2) - l)/2; q2 = q + (nhood(2) - l)/2; 
[pp, qq] = ndgrid(p1:p2, q1:q2); 
pp = pp(:); qq = qq(:); 
% °/0 Throw away neighbor coordinates that are out of bounds in 
% °/o the rho direction. 
badrho = find((pp < 1) | (pp > size(h, 1))); 
pp(badrho) = [] ; qq (badrho) = [] ; 
% °/0 For coordinates that are out of bounds in the theta 
% °/o direction, we want to consider that H is antisymmetric 
% °/o along the rho axis for theta = +/- 90 degrees. 
theta_too_low = find(qq < 1) ; 
% Глава 10. Сегментация изображений 
qq(theta_too_low) = size(h, 2) + qq(theta_too_low); 
pp(theta_too_low) = size(h, 1) - pp(theta_too_low) + 1; 
theta_too_high = find(qq > size(h, 2)); 
qq(theta_too_high) = qq(theta_too_high) - size(h, 2); 
pp(theta_too_high) = size(h, 1) - pp(theta_too_high) + 1; 
% Convert to linear indices to zero out all the values. 
hnew(sub2ind(size(hnew), pp, qq)) = 0; 
done = length(r) == numpeaks; 
else 
done = true; 
end 
end 
