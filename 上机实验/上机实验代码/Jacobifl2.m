 function m=Jacobifl2(A,b,max1,x0,err)
%��ʼֵx0������max1������err
m=x0;
n=length(x0);
for k=1:max1 %jacobiѭ��
    for i=1:n
        a=b(i);
        for j=1:n
            if j~=i
                a=a-A(i,j)*x0(j);
            end
        end
        x(i)=a/A(i,i);
        %x(1)��x(n)�����һ�ε���
    end
    m=[m;x];%�������ּ�һ��
    if norm(x-x0)<err
        return
    else
        x0=x;
    end
end