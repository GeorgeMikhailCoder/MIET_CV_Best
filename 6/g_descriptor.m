function res = g_descriptor(gran,n)
% n=0 - circle
% n=1 - square
% n=2 - delta
if(n==0)
r = c_descriptor(gran);
C = r{4};
figure
hold on
plot(gran(1,:),gran(2,:),'b');
plot(C(1,:),C(2,:),'g');
res=r;
else
if(n==1)
r = s_descriptor(gran);
S = r{4};
figure
hold on
plot(gran(1,:),gran(2,:),'b');
plot(S(1,:),S(2,:),'g');
res=r;
else
if(n==2)
    r = d_descriptor(gran);
    figure
    plot(gran(1,:),gran(2,:),'b');
else
   res=-1; 
end
end
end
xlabel(r{1})
end