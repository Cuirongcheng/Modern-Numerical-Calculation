% 上机题2-3 加速迭代法
% 崔荣成 2019/11/27
x=0;xx=1;i=0;
while abs(xx-x)>5*1e-4 
       y=exp(x)+10*x-2;
       z=exp(y)+10*y-2;
       xx=x;
       x=x-(y-x)^2/(z-2*y+x);
       i=i+1;
end
fprintf('迭代法计算次数为%i\n',i) 
fprintf('迭代法计算结果为%.8f\n',y);