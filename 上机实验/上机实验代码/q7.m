% �ϻ���7 ���޲�ַ�����ֵ����
% ���ٳ� 2019/12/8
h=0.0001;
h1=0.1;
L=YXCFF_D(h);
L1=YXCFF_D(h1);
X=-1:h:1;
X1=-1:h1:1;
figure1=figure('Color',[1 1 1]);
gxt=plot(X,L,'b-',X1,L1,'r*-');
title('���޲�ַ�','FontSize',14,'FontWeight','Bold');
xlabel('����ֵx','FontSize',14,'FontWeight','Bold');
ylabel('ֵy','FontSize',14,'FontWeight','Bold');
set(gxt,'LineWidth',1);
legend('h=0.0001','h=0.1');
grid on;