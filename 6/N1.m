clear
close all
I = imread('mygran.png');
I = rgb2gray(I);
I(I>30)=255;
I(I<=30)=0;
I = imbinarize(I);

[B,L] = bwboundaries(I,'noholes');
%        imshow(label2rgb(L, @jet, [.5 .5 .5]))
imshow(I)

hold on
rmass = zeros(21,4);
pmass = zeros(21,2);
       for k = 1:length(B)
           boundary = B{k};
           boundary = [boundary(:,2)' ; boundary(:,1)'];
           res = [0 0 0 0];
           r = c_descriptor(boundary);
           C = r{4};
           res(1) = r{1};
           r = s_descriptor(boundary);
           S = r{4};
           res(2) = r{1};
           plot(boundary(1,:), boundary(2,:), 'g', 'LineWidth', 2)
           plot(C(1,:),C(2,:),'y')
           plot(S(1,:),S(2,:),'r')
           
           res(3) = res(2)-res(1);
           res(4) = res(2)/res(1);
           rmass(k,:) = res

           pause(1)
       end
rmass = rmass
t = array2table(rmass,'VariableNames',{'x' 'y' 'z', 't'})
writetable(t,'table.xls','FileType','spreadsheet')
stat = zeros(2,4);
stat(1,1) = min(rmass(:,1));
stat(1,2) = min(rmass(:,2));
stat(1,3)= min(rmass(:,3));
stat(1,4)= min(rmass(:,4));
stat(2,1) = max(rmass(:,1));
stat(2,2) = max(rmass(:,2));
stat(2,3)= max(rmass(:,3));
stat(2,4)= max(rmass(:,4));
stat=stat

