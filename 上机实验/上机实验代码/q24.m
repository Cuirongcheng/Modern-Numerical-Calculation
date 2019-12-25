% 上机题2-4 牛顿迭代法
% 崔荣成 2019/11/27
x=0;y=0.1;i=0;
while abs(y-x)>5*1e-4 
       y=x;
       x=x-(exp(x)+10*x-2)/(exp(x) + 10);
       i=i+1;
end 
fprintf('迭代法计算次数为%i\n',i) 
fprintf('迭代法计算结果为%.8f\n',x);