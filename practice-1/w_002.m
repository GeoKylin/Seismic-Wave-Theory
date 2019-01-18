clear
close all
clc

c=1000;                 %波速
r=1500;                 %距离点震源的距离
a=r/c;                  %令a=r/c
N=4000;                 %角频率点数
dw=0.001;               %角频率间隔

w=0:dw:(N-1)*dw;        %角频率
F1=1./(1+a*w*1i);       %近震源滤波器频率谱
figure;plot(w,abs(F1));grid on;title('近震源滤波器振幅谱|F_1(w)|');
xlabel('\omega/Hz');ylabel('A');
phi=angle(F1);          %计算相位
figure;plot(w,phi);grid on;title('近震源滤波器相位谱\Phi_1(w)');
xlabel('\omega/Hz');ylabel('\phi/rand');

F2=(a*w*1i)./(1+a*w*1i);%远震源滤波器频率谱
figure;plot(w,abs(F2));grid on;title('远震源滤波器振幅谱|F_2(w)|');
xlabel('\omega/Hz');ylabel('A');
phi=angle(F2);          %计算相位
figure;plot(w,phi);grid on;title('远震源滤波器相位谱\Phi_2(w)');
xlabel('\omega/Hz');ylabel('\phi/rand');