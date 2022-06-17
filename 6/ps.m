function res = ps(x1,y1,x2,y2)
% res = sqrt((x1-x2).^2+(y1-y2).^2);
res = max(abs(x1-x2),abs(y1-y2));
end

