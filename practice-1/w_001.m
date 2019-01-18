clear
close all
clc

c=400;%波速
r=100;%距离点震源的距离
a=r/c;%令a=r/c
N=1000;%采样点数
dt=0.005;%时间域采样间隔s
t=(0:N-1)*dt;%时间序列

f=sin(0.001*pi*t)+0.01*sin(60*pi*t);%震源强度函数
figure;
plot(t,f);xlabel('t');ylabel('A');title('震源强度函数f(t-r/c)');grid on; 

ff=diff(f);%震源强度函数的导函数
f=f(1:end-1);
u=-((1/(r*c).*ff)+(1/(r^2).*f));%位移场函数
figure;
plot(t(1:N-1),u);xlabel('t');ylabel('A');title('位移场函数u_p(t)');grid on;

U=fft(u);
U=fftshift(U);
w=((1:N-1)-N/2)/(N*dt); %频率
figure;
plot(w,abs(U));grid on;title('位移场函数的振幅谱U(w)');
phi=angle(U);%计算相位
figure;%subplot(3,6,5);
plot(w,phi);grid on;title('位移场函数的相位谱\Phi_U(w)');

F1=1./(1+a*w*1i);%近震源滤波器频率谱
F2=(a*w*1i)./(1+a*w*1i);%远震源滤波器频率谱

U1=U.*F1;
figure;%subplot(3,6,10);
plot(w,abs(U1));grid on;title('近震源分量的振幅谱U_1(w)');
phi=angle(U1);%计算相位
figure;%subplot(3,6,11);
plot(w,phi);grid on;title('近震源分量的相位谱\Phi_{U1}(w)');
u1=ifft(U1);
figure;%subplot(3,6,12);
plot(t(1:N-1),abs(u1));grid on;title('近震源分量的时间域u_1(t)');

U2=U.*F2;
figure;%subplot(3,6,13);
plot(w,abs(U2));grid on;title('远震源分量的振幅谱U_2(w)');
phi=angle(U2);%计算相位
figure;%subplot(3,6,14);
plot(w,phi);grid on;title('远震源分量的相位谱\Phi_{U2}(w)');
u2=ifft(U2);
figure;%subplot(3,6,15);
plot(t(1:N-1),abs(u2));grid on;title('远震源分量的时间域u_2(t)');

uu=u1+u2;
figure;%subplot(3,6,17);
plot(t(1:N-1),abs(uu));xlabel('t');ylabel('A');title('远近震源分量叠加的时间域u(t)');grid on;
figure;%subplot(3,6,18);
plot(t(1:N-1),abs(u));xlabel('t');ylabel('A');title('位移场函数的绝对值|u_p(t)|');grid on;

e=(abs(uu)-abs(u))./abs(u);
figure;%subplot(3,6,18);
plot(t(1:N-1),abs(e));xlabel('t');ylabel('%');title('u(t)与|u_p(t)|的绝对误差e(t)');grid on;