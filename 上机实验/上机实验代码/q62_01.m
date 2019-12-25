% 上机题6-2 改进欧拉求解 步长为0.1
% 崔荣成 2019/12/10
clc;clear;
b=[-2 1;-998 -999];
[v,d]=eig(b)
f=@(x,y1,y2)(-2*y1+y2+2*sin(x));     
g=@(x,y1,y2)(998*y1-999*y2+999*cos(x)-999*sin(x));
h=0.1; 
y1(1)=2;y2(1)=3;x(1)=0; 
for i=1:10000
K1=h*f(x(i),y1(i),y2(i)); 
L1=h*g(x(i),y1(i),y2(i)); 
K2=h*f(x(i)+0.5*h,y1(i)+0.5*K1,y2(i)+0.5*L1); 
L2=h*g(x(i)+0.5*h,y1(i)+0.5*K1,y2(i)+0.5*L1); 
x(i+1)=x(i)+h; 
y1(i+1)=y1(i)+K2;
y2(i+1)=y2(i)+L2;
%fprintf('%6s %6s %6s\n','x','y1','y2')
%fprintf('%6s %6s %6s\n',x,y1,y2)
end 
x1=0:0.001:10;
Y1=2*exp(-x1)+sin(x1);
Y2=2*exp(-x1)+cos(x1);
c=y1-Y1;
d=y2-Y2;
subplot(2,1,1) 
plot(x,y1,'r*',x,Y1,'g-','LineWidth',2) 
C1=mean(abs(y1-Y1))
C2=mean(abs(y2-Y2))
legend('y1近似解','Y1精确解'); 
title('h=0.1时曲线y1和y2精确解和近似解'); 
ylabel('y1和Y1') 
subplot(2,1,2) 
plot(x,y2,'r*',x,Y2,'g-','LineWidth',2) 
legend('y2近似解','Y2精确解');
ylabel('y2和Y2')