function res = Circle(R, x0,y0,h);
if(nargin<=3)
    h=R/10;
end
if(nargin==1)
    x0=0;
    y0=0; 
end

xmin = x0-R;
xmax = x0+R;
% ymin = y0-R;
% ymax = y0+R;

tx1 = xmin:h:xmax;
ty1 = abs(sqrt(R^2 - (tx1-x0).^2))+y0;
tx2 = xmax:-h:xmin;
ty2 = -abs(sqrt(R^2 - (tx2-x0).^2))+y0;
x = [tx1 tx2];
y = [ty1 ty2];
res = [x;y];
end