% 上机题3 拟合曲线与求均方差
% 崔荣成 2019/11/29
x=[2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]; % 录入数据
y=[6.42 8.2 9.58 9.5 9.7 10 9.93 9.99 10.49 10.59 10.60 10.8 10.6 10.9 10.76];
A=[sum(x.^2),sum(x),-sum(x.*y); sum(x),15,-sum(y); sum(x.*y),sum(y),-sum(y.^2)];
B=[sum(x.^2.*y);sum(x.*y);sum(y.^2.*x)]; % 分别表示AB
f=A\B;  % 求解方程组计算a,b,c
a=f(1);b=f(2);c=f(3);
z=linspace(2,50,48);
Y=(f(1)*z+f(2))./(f(3)+z);
plot(x,y,'r*',z,Y,'b-');    % 绘制拟合曲线图像
xlabel('钢水包使用次数x');
ylabel('容积y');
title('次数和容积之间的关系');%添加图像标题
fprintf('a=%f\nb=%f\nc=%f\n',a,b,c);
fprintf('拟合出来的方程式为:\n(%7.4f+x)y=%7.4f+%7.4fx\n',f(3),f(2),f(1));
for i=1:15  %求均方差 
    y1(i)=(f(2)+f(1)*x(i))/(f(3)+x(i));
end
c=0;
for i=1:15
    c=c+(y(i)-y1(i))^2;
end
jfc=sqrt(c/15);
fprintf('均方差为%f\n',jfc)