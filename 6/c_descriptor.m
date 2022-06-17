function res = c_descriptor(gran)
N = length(gran);
xg = gran(1,:);
yg = gran(2,:);
xc = sum(xg)/N;
yc = sum(yg)/N;
r = pc(xg,yg,xc,yc);
rm =sum(r)/N;
r = abs(r-rm);
res{1} = sum(r)/rm;
res{2} = rm;
res{3} = [xc,yc];
res{4} = Circle(rm,xc,yc);
end