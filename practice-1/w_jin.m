clear
close all
clc

c=1000;%����
r=1500;%�������Դ�ľ���
a=r/c;%��a=r/c
N=4000;%��Ƶ�ʵ���
dw=0.001;%��Ƶ�ʼ��

w=0:dw:(N-1)*dw;%��Ƶ��
F=1./(1+a*w*1i);%Զ��Դ�˲���Ƶ����
plot(w,abs(F));grid on;title('����Դ�˲��������');
phi=angle(F);%������λ
figure;plot(w,phi);grid on;title('����Դ�˲�����λ��');