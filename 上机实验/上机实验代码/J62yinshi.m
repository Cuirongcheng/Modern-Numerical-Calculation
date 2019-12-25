clear all;close all; 
clc; 
f=@(x,y1,y2)(-2*y1+y2+2*sin(x));     
g=@(x,y1,y2)(998*y1-999*y2+999*cos(x)-999*sin(x)); 
h = 0.1; 
x(1) = 0; 
y1(1) = 2;  
y2(1) = 3;  
x=0:0.1:10; 
for i = 1 : 100 
     k1 = f(x(i),y1(i),y2(i)); 
     l1 = g(x(i),y1(i),y2(i)); 
     A = [1 + h ,-h / 2;- 998* h / 2,1 + 999  * h/ 2]; 
     B = [2*sin(x(i) + h);999*cos(x(i) + h)- 999*sin(x(i) + h)]; 
     y = [y1(i) + 0.5*h* k1;y2(i) + 0.5*h* l1]; 
     C = [-2  1;998  -999]; 
     D = C * y + B; 
    K = A \ D; 
    k2 = K(1); 
    l2 = K(2); 
   y1(i + 1) = y1(i) + (k1 + k2) * h *0.5; 
   y2(i + 1) = y2(i) + (l1 + l2) * h *0.5; 
   end 
for j = 1 : 101 
    Y1(j) = 2 * exp(-x(j)) + sin(x(j)); 
    Y2(j) = 2 * exp(-x(j)) + cos(x(j)); 
end 
subplot(211); 
plot(x ,y1 ,'r*' ,x ,Y1, 'b-', 'LineWidth',1); 
legend('y1 隐式梯形格式近似解', 'Y1 精确解'); 
title('隐式梯形 y1 精确解和近似解的对比'); 
ylabel('y1'); 
subplot(212); 
plot(x ,y2, 'r*', x ,Y2 ,'b-' ,'LineWidth', 1); 
legend('y2 隐式梯形格式近似解', 'Y2 精确解'); 
title('隐式梯形 y2 精确解和近似解的对比'); 
ylabel('y2'); 
err1 = max(abs(y1-Y1))
err2 = max(abs(y2-Y2))