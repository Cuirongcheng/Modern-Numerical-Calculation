% �ϻ���2-3 ���ٵ�����
% ���ٳ� 2019/11/27
x=0;xx=1;i=0;
while abs(xx-x)>5*1e-4 
       y=exp(x)+10*x-2;
       z=exp(y)+10*y-2;
       xx=x;
       x=x-(y-x)^2/(z-2*y+x);
       i=i+1;
end
fprintf('�������������Ϊ%i\n',i) 
fprintf('������������Ϊ%.8f\n',y);