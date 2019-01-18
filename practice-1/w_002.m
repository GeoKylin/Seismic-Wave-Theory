clear
close all
clc

c=1000;                 %����
r=1500;                 %�������Դ�ľ���
a=r/c;                  %��a=r/c
N=4000;                 %��Ƶ�ʵ���
dw=0.001;               %��Ƶ�ʼ��

w=0:dw:(N-1)*dw;        %��Ƶ��
F1=1./(1+a*w*1i);       %����Դ�˲���Ƶ����
figure;plot(w,abs(F1));grid on;title('����Դ�˲��������|F_1(w)|');
xlabel('\omega/Hz');ylabel('A');
phi=angle(F1);          %������λ
figure;plot(w,phi);grid on;title('����Դ�˲�����λ��\Phi_1(w)');
xlabel('\omega/Hz');ylabel('\phi/rand');

F2=(a*w*1i)./(1+a*w*1i);%Զ��Դ�˲���Ƶ����
figure;plot(w,abs(F2));grid on;title('Զ��Դ�˲��������|F_2(w)|');
xlabel('\omega/Hz');ylabel('A');
phi=angle(F2);          %������λ
figure;plot(w,phi);grid on;title('Զ��Դ�˲�����λ��\Phi_2(w)');
xlabel('\omega/Hz');ylabel('\phi/rand');