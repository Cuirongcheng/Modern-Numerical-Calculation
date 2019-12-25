% 上机题6-1 改进欧拉公式求初值
% 崔荣成 2019/12/10
clc;clear;close all; 
f=@(x,y1,y2)(-2*y1+y2+2*sin(x));     
g=@(x,y1,y2)(1*y1-2*y2+2*cos(x)-2*sin(x)); 
a=0; 
b=10; 
h=0.1; 
y1(1)=2;y2(1)=3;x(1)=0; 
for i=1:100 
K1=f(x(i),y1(i),y2(i));  
L1=g(x(i),y1(i),y2(i));  
K2=f(x(i)+h,y1(i)+h*K1,y2(i)+h*L1);
L2=g(x(i)+h,y1(i)+h*K1,y2(i)+h*L1); 
x(i+1)=x(i)+h;  
y1(i+1)=y1(i)+h*(1/2)*(K1+K2);
y2(i+1)=y2(i)+h*(1/2)*(L1+L2); 
end  
x=0:0.1:10; 
for k=1:101; 
    Y1(k)=2*exp(-x(k))+sin(x(k)); 
    Y2(k)=2*exp(-x(k))+cos(x(k)); 
end 
subplot(2,1,1) 
plot(x,y1,'r-',x,Y1,'o') 
legend('y1','y1 精确值'); 
title('h=0.1-方程组(1)y1 的解及精确解曲线'); 
subplot(2,1,2) 
plot(x,y2,'b--',x,Y2,'r+') 
legend('y2','y2 精确值'); 
title('h=0.1-方程组(1)y2 的解及精确解曲线'); 
error=max(norm(y1-Y1,inf),norm(y2-Y2,inf))    
