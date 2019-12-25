function [x,k,m]=SOR1(A,b,x0,eps,max1)
n=length(x0);
a=x0;
for s=1:19
    x0=a;
    w(s)=s/10;
    x(1)=x0(1)+w(s)*(b(1)-A(1,1:n)*x0(1:n)')/A(1,1);
    for i=2:n
        x(i)=x0(i)+w(s)*(b(i)-A(i,1:i-1)*x(1:i-1)'-A(i,i:n)*x0(i:n)')/A(i,i);
    end
    k(s)=0;
    while norm(x-x0,2)>=eps 
        x0=x;
        x(1)=x0(1)+w(s)*(b(1)-A(1,1:n)*x0(1:n)')/A(1,1);
        for i=2:n
           x(i)=x0(i)+w(s)*(b(i)-A(i,1:i-1)*x(1:i-1)'-A(i,i:n)*x0(i:n)')/A(i,i); 
        end
        k(s)=k(s)+1;
        if (k(s)>=max1)
           disp('超出迭代次数上限！\n');
           return;
        end
    end
    Data{s}=x;
end
[min1,index]=min(k);
x=Data{index};
k=min1;
m=w(index);
fprintf('x=\n%4.8f\n%4.8f\n%4.8f\n%4.8f\n%4.8f\n%4.8f',x());
fprintf('\n步数最小=%2.2f, 步数n=%d 。\n',m,k);
