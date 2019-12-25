% 上机题6-1 经典R-K方法求解初值问题
% 崔荣成 2019/12/6
clear
format long
N=100;
h=0.002;            % 取步长0.1
A=[-2,1;1,-2];
y(2,N+1)=zeros();     %2行501列的矩阵
y(:,1)=[2,3]';
for k=2:N+1
    x=(k-1)*h;
    k1=h*(A*y(:,k-1)+[2*sin(x),2*cos(x)-2*sin(x)]');
k2=h*(A*(y(:,k-1)+k1/2)+[2*sin(x+h/2),2*cos(x+h/2)-2*sin(x+h/2)]');
k3=h*(A*(y(:,k-1)+k2/2)+[2*sin(x+h/2),2*cos(x+h/2)-2*sin(x+h/2)]');
k4=h*(A*(y(:,k-1)+k3)+[2*sin(x+h),2*cos(x+h)-2*sin(x+h)]');
y(:,k)=y(:,k-1)+(k1+2*k2+2*k3+k4)/6;
end
z(2,N+1)=zeros();
for k=1:N+1
    x=(k-1)*h;
    z(1,k)=2*exp(-x)+sin(x);
    z(2,k)=2*exp(-x)+cos(x);
end
err1=(z(1,:)-y(1,:));%./abs(z(1,:));
err2=(z(2,:)-y(2,:));%./abs(z(2,:));
plot(err1,'b-*')
hold on
plot(err2,'r-^')