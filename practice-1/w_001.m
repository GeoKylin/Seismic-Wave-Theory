clear
close all
clc

c=400;%����
r=100;%�������Դ�ľ���
a=r/c;%��a=r/c
N=1000;%��������
dt=0.005;%ʱ����������s
t=(0:N-1)*dt;%ʱ������

f=sin(0.001*pi*t)+0.01*sin(60*pi*t);%��Դǿ�Ⱥ���
figure;
plot(t,f);xlabel('t');ylabel('A');title('��Դǿ�Ⱥ���f(t-r/c)');grid on; 

ff=diff(f);%��Դǿ�Ⱥ����ĵ�����
f=f(1:end-1);
u=-((1/(r*c).*ff)+(1/(r^2).*f));%λ�Ƴ�����
figure;
plot(t(1:N-1),u);xlabel('t');ylabel('A');title('λ�Ƴ�����u_p(t)');grid on;

U=fft(u);
U=fftshift(U);
w=((1:N-1)-N/2)/(N*dt); %Ƶ��
figure;
plot(w,abs(U));grid on;title('λ�Ƴ������������U(w)');
phi=angle(U);%������λ
figure;%subplot(3,6,5);
plot(w,phi);grid on;title('λ�Ƴ���������λ��\Phi_U(w)');

F1=1./(1+a*w*1i);%����Դ�˲���Ƶ����
F2=(a*w*1i)./(1+a*w*1i);%Զ��Դ�˲���Ƶ����

U1=U.*F1;
figure;%subplot(3,6,10);
plot(w,abs(U1));grid on;title('����Դ�����������U_1(w)');
phi=angle(U1);%������λ
figure;%subplot(3,6,11);
plot(w,phi);grid on;title('����Դ��������λ��\Phi_{U1}(w)');
u1=ifft(U1);
figure;%subplot(3,6,12);
plot(t(1:N-1),abs(u1));grid on;title('����Դ������ʱ����u_1(t)');

U2=U.*F2;
figure;%subplot(3,6,13);
plot(w,abs(U2));grid on;title('Զ��Դ�����������U_2(w)');
phi=angle(U2);%������λ
figure;%subplot(3,6,14);
plot(w,phi);grid on;title('Զ��Դ��������λ��\Phi_{U2}(w)');
u2=ifft(U2);
figure;%subplot(3,6,15);
plot(t(1:N-1),abs(u2));grid on;title('Զ��Դ������ʱ����u_2(t)');

uu=u1+u2;
figure;%subplot(3,6,17);
plot(t(1:N-1),abs(uu));xlabel('t');ylabel('A');title('Զ����Դ�������ӵ�ʱ����u(t)');grid on;
figure;%subplot(3,6,18);
plot(t(1:N-1),abs(u));xlabel('t');ylabel('A');title('λ�Ƴ������ľ���ֵ|u_p(t)|');grid on;

e=(abs(uu)-abs(u))./abs(u);
figure;%subplot(3,6,18);
plot(t(1:N-1),abs(e));xlabel('t');ylabel('%');title('u(t)��|u_p(t)|�ľ������e(t)');grid on;