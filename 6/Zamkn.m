function res = Zamkn(I,x0,y0)

x=x0;
y=y0;
isp = zeros(size(I));
isp(x0,y0)=1;
p=0;%переход

for i=0:8
xnew=x + fix(cos(i*pi/4));
ynew=y + fix(sin(i*pi/4));
    if(I(xnew,ynew)==true ...
    && isp(xnew,ynew)==0)
        x=xnew;
        y=ynew;
        isp(x,y)=true;
        p=1;
    end
end
k=0;
while (x~=x0 && y~=y0 || p==1)
p=0;
for i=0:8
xnew=x + fix(cos(i*pi/4));
ynew=y + fix(sin(i*pi/4));
    if(I(xnew,ynew)==true ...
    && isp(xnew,ynew)==0)
        x=xnew;
        y=ynew;
        isp(x,y)=true;
        p=1;
        break;        
    end
    k=k+1;
    mass(1,k)=x;
    mass(2,k)=y;
    mass=mass;
    pause(0.1)
    plot(mass(1,:),mass(2,:))
end
end
if(p==0)
   res =0;
else
s = size(isp);
for i=1:1:s(1)
    for j=1:1:s(2)
        if(isp(i,j)==1)
            res(1,:) = [res(1,:) i];
            res(2,:) = [res(1,:) j];
        end
    end
end

end
