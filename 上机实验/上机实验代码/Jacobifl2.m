 function m=Jacobifl2(A,b,max1,x0,err)
%初始值x0，次数max1，精度err
m=x0;
n=length(x0);
for k=1:max1 %jacobi循环
    for i=1:n
        a=b(i);
        for j=1:n
            if j~=i
                a=a-A(i,j)*x0(j);
            end
        end
        x(i)=a/A(i,i);
        %x(1)到x(n)即完成一次迭代
    end
    m=[m;x];%矩阵中又加一行
    if norm(x-x0)<err
        return
    else
        x0=x;
    end
end