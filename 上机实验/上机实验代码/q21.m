% �ϻ���2-1 [0,1]�϶��ַ�
% ���ٳ� 2019/11/27
a=0;b=1.0;i=0;
while abs(b-a)>5*1e-4 
       c=(b+a)/2;
       if exp(c)+10*c-2>0
           b=c;
       else a=c;
       end    
       i=i+1;
end
fprintf('���ַ��������Ϊ%i\n',i) 
fprintf('���ַ�������Ϊ%.8f\n',c)