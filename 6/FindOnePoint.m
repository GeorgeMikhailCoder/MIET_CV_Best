function [x y] = FindOnePoint(I,Checked,x0,y0)
if(nargin==2)
    x0=1;
    y0=1;
end

s=size(I);
x=-1;
y=-1;
for i=x0:1:s(1)
    for j=y0:1:s(2)
        if(I(i,j)==1 && Checked(i,j)==0)
        x=i;
        y=j;
        break;
        end
    end
    if(x>0)
        break;
    end
end
end