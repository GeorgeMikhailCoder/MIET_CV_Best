function res = Sqaure(R, x0,y0,h);
if(nargin<=3)
    h=R;
end
if(nargin==1)
    x0=0;
    y0=0; 
end

xmin = x0-R;
xmax = x0+R;
ymin = y0-R;
ymax = y0+R;
tx1 = xmin:h:xmax;
tx2 = xmax:-h:xmin;
ty1 = ymin:h:ymax;
ty2 = ymax:-h:ymin;
x1 = xmin*ones(size(ty1));
x2 = xmax*ones(size(ty1));
y1 = ymin*ones(size(tx1));
y2 = ymax*ones(size(tx1));
x = [x1 tx1 x2 tx2];
y = [ty1 y2 ty2 y1];
res = [x;y];
end