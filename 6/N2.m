close all
clear

g_descriptor(Circle(2),0)       ,title('Circle by circle normal');
g_descriptor(Circle(4),0)       ,title('Circle by circle increase');
g_descriptor(Circle(2,2,1),0)   ,title('Circle by circle moved');
g_descriptor(Square(2),0)       ,title('Square by circle normal');
g_descriptor(Square(4),0)       ,title('Square by circle increase');
g_descriptor(Square(2,2,1),0)   ,title('Square by circle moved');

g_descriptor(Circle(2),1)       ,title('Circle by square normal');
g_descriptor(Circle(4),1)       ,title('Circle by square increase');
g_descriptor(Circle(2,2,1),1)   ,title('Circle by square moved');
g_descriptor(Square(2),1)       ,title('Square by square normal');
g_descriptor(Square(4),1)       ,title('Square by square increase');
g_descriptor(Square(2,2,1),1)   ,title('Square by square moved');


t = -1:0.1:1;
x(1:1:length(t))=-1;
y = [t -x -t x];
x = [x t -x -t];
y(length(t)+5:length(t)+15)=y(length(t)+5:length(t)+15)+0.5;
x(fix(2.5*length(t))) = 0;
fig1 = [x;y];
fig2 = [y;x];
fig3 = [fig1(1,:)+5; fig1(2,:)-2];
fig4 = 3.*fig1;

g_descriptor(fig1,0),title('Figure by circle normal');
g_descriptor(fig2,0),title('Figure by circle rotated');
g_descriptor(fig3,0),title('Figure by circle moved');
g_descriptor(fig4,0),title('Figure by circle increase');

g_descriptor(fig1,1),title('Figure by square normal');
g_descriptor(fig2,1),title('Figure by square rotated');
g_descriptor(fig3,1),title('Figure by square moved');
g_descriptor(fig4,1),title('Figure by square increase');