function y=YXCFF_D(h)
n=(1-(-1))/h;
x(1)=-1;
for i=1:n-1 % n-1 
    x(i)=x(1)+(i-1)*h;
    q(i)=(1+x(i)^2);
    B(i)=2/(h^2)+q(i);
end 
for i=1:n-2 % n-2 
    C(i)=-1/(h^2);
end
b(1)=0+1/(h^2); 
b(n-1)=0+1/(h^2); 
for i=2:n-2
    b(i)=0;
end
b=b';% n-1 
u(1)=b(1)/B(1);
v(1)=C(1)/B(1);
for k=2:n-2;
    u(k)=(b(k)-u(k-1)*C(k-1))/(B(k)-v(k-1)*C(k-1));
    v(k)=C(k)/(B(k)-v(k-1)*C(k-1));
end
u(n-1)=(b(n-1)-u(n-2)*C(n-2))/(B(n-1)-v(n-2)*C(n-2));
V(n-1)=u(n-1);
for k=n-2:-1:1
    V(k)=u(k)-v(k)*V(k+1);
end
y=[1,V,1];

