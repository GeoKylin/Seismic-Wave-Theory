clear
close all
clc

c=1000;%波速
r=1500;%距离点震源的距离
a=r/c;%令a=r/c
N=4000;%角频率点数
dw=0.001;%角频率间隔

w=0:dw:(N-1)*dw;%角频率
F=1./(1+a*w*1i);%远震源滤波器频率谱
plot(w,abs(F));grid on;title('近震源滤波器振幅谱');
phi=angle(F);%计算相位
figure;plot(w,phi);grid on;title('近震源滤波器相位谱');