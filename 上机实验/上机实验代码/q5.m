% �ϻ���5 ���ݵ�����������ֵ����������
% ���ٳ� 2019/12/5
A=[6 3 1;3 2 1;1 1 1];
v=[1 1 1]';
eps=0.001;
p=11;
[n,n]=size(A);
A=A-p*eye(n);
v0=v;
[tmax,tindex]=max(abs(v0));
lamd0=v0(tindex);
u0=v0/lamd0;
flag=0;
k=0;
while(flag==0)
    V=A\u0;
    [tmax,tindex]=max(abs(V));
    lamd1=V(tindex);
    u0=V/lamd1;
    if (abs((lamd0)^(-1)-(lamd1)^(-1)))<=eps
        flag=1;
    end
    lamd0=lamd1;
    k=k+1;
end
lamda=(lamd1)^(-1)+p;
V=u0';
fprintf('��ӽ�11������ֵΪ:%4.8f\n��������Ϊ��%d\n����������\n%4.8f\n%4.8f\n%4.8f\n',lamda,k,V);

