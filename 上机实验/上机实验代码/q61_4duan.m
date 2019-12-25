% 上机题6-1 4段4阶龙格库塔格式求初值
% 崔荣成 2019/12/10
f=@(x,y1,y2)(-2*y1+y2+2*sin(x))     
g=@(x,y1,y2) (y1-2*y2+2*cos(x)-2*sin(x)); 
h=0.1; 
y1(1)=2;y2(1)=3;x(1)=0; 
for i=1:100
K1=f(x(i),y1(i),y2(i)); 
L1=g(x(i),y1(i),y2(i)); 
K2=f(x(i)+0.5*h,y1(i)+0.5*h*K1,y2(i)+0.5*h*L1); 
L2=g(x(i)+0.5*h,y1(i)+0.5*h*K1,y2(i)+0.5*h*L1); 
K3=f(x(i)+0.5*h,y1(i)+0.5*h*K2,y2(i)+0.5*h*L2); 
L3=g(x(i)+0.5*h,y1(i)+0.5*h*K2,y2(i)+0.5*h*L2); 
K4=f(x(i)+h,y1(i)+h*K3,y2(i)+h*L3); 
L4=g(x(i)+h,y1(i)+h*K3,y2(i)+h*L3); 
x(i+1)=x(i)+h; 
y1(i+1)=y1(i)+h*(1/6)*(K1+2*K2+2*K3+K4); 
y2(i+1)=y2(i)+h*(1/6)*(L1+2*L2+2*L3+L4); 
end 
x=0:0.1:10; 
for i=1:101; 
Y1(i)=2*exp(-x(i))+sin(x(i)); 
Y2(i)=2*exp(-x(i))+cos(x(i)); 
end 
c=y1-Y1; 
d=y2-Y2; 
subplot(2,1,1) 
plot(x,y1,'r*',x,Y1,'b-') 
error=max(norm(y1-Y1,inf),norm(y2-Y2,inf))
legend('y1龙格库塔近似解','Y1精确解'); 
title('第一问曲线y1精确解和近似解的对比'); 
ylabel('y1曲线 Y1曲线') 
subplot(2,1,2) 
plot(x,y2,'r*',x,Y2,'b-') 
legend('y2龙格库塔近似解','Y2精确解'); 
title('第一问曲线y2精确解和近似解的对比'); 
ylabel('y2曲线 Y2曲线')