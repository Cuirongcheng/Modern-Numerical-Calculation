clc
a=[-2 1;1 -2];
[v,d]=eig(a)
f=@(x,y1,y2)(-2*y1+y2+2*sin(x));     
g=@(x,y1,y2) (y1-2*y2+2*cos(x)-2*sin(x)); 
h=0.1; 
y1(1)=2;y2(1)=3;x(1)=0; 
for i=1:100
K1=h*f(x(i),y1(i),y2(i)); 
L1=h*g(x(i),y1(i),y2(i)); 
K2=h*f(x(i)+0.5*h,y1(i)+0.5*K1,y2(i)+0.5*L1); 
L2=h*g(x(i)+0.5*h,y1(i)+0.5*K1,y2(i)+0.5*L1); 
x(i+1)=x(i)+h; 
y1(i+1)=y1(i)+K2;
y2(i+1)=y2(i)+L2;
end 
x1=0:0.1:10;
for i=1:101
Y1(i)=2*exp(-x1(i))+sin(x1(i)); 
Y2(i)=2*exp(-x1(i))+cos(x1(i)); 
end 
c=y1-Y1;
d=y2-Y2;
subplot(2,1,1) 
plot(x,y1,'r*',x,Y1,'b-','LineWidth',2) 
C=mean(abs(y1-Y1))
C1=mean(abs(y2-Y2))
legend('y1龙格库塔近似解','Y1精确解'); 
title('h=0.1时曲线的精确解和近似解'); 
ylabel('y1和Y1') 
subplot(2,1,2) 
plot(x,y2,'r*',x,Y2,'b-','LineWidth',2) 
legend('y2龙格库塔近似解','Y2精确解'); 
ylabel('y2和Y2')
