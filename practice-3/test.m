%输入层参数
rho1=2.7e3;     rho2=0.9e3; %密度
vp1=4500;       vp2=3600;   %纵波速度
vs1=2200;       vs2=1700;   %横波速度
%计算相关参数
gama1=vs1/vp1;  gama2=vs2/vp2;  %横纵波速比
z1=rho1*vp1;    z2=rho2*vp2;    %纵波阻抗
w1=rho1*vs1;    w2=rho2*vs2;    %横波阻抗
%求解佐普里兹方程
for i=0:90  %从0度到90度，每隔1度取一个点
    k=i+1;  %序号
    %计算反射透射角度
    id(k)=i;Id=i/180*pi;            is(k)=asin(vs1/vp1*sin(Id));
    td(k)=asin(vp2/vp1*sin(Id));    ts(k)=asin(vs2/vp1*sin(Id));
    %求解佐普里兹方程
    A=[sin(Id) cos(is(k)) -sin(td(k)) cos(ts(k));...
       cos(Id) -sin(is(k)) cos(td(k)) sin(ts(k));...
       z1*cos(2*is(k)) -w1*sin(2*is(k)) -z2*cos(2*ts(k)) -w2*sin(ts(k));...
       gama1*w1*sin(2*Id) w1*cos(2*is(k)) gama2*w2*sin(2*td(k)) -w2*cos(2*ts(k))];
    b=[-sin(Id);cos(Id);-z1*cos(2*is(k));gama1*w1*sin(2*Id)];
    X=A\b;
    %求得反射透射系数
    Rpp(k)=X(1);    Rps(k)=X(2);
    Tpp(k)=X(3);    Tps(k)=X(4);
    %计算各个波的能量
    Ip(k)=rho1*vp1*cos(Id);
    IRpp(k)=rho1*vp1*(Rpp(k))^2*cos(Id);
    IRps(k)=rho1*vs1*(Rps(k))^2*cos(is(k));
    ITpp(k)=rho2*vp2*(Tpp(k))^2*cos(td(k));
    ITps(k)=rho2*vs2*(Tps(k))^2*cos(ts(k));
    I(k)=IRpp(k)+IRps(k)+ITpp(k)+ITps(k);
    %计算相对误差
    e(k)=abs((I(k)-Ip(k))/Ip(k));
end
%绘制反射透射系数曲线
figure;plot(id,Rpp,'-r',id,Rps,'--r',id,Tpp,'-g',id,Tps,'--g');grid on;
xlabel('i_d(\circ)');ylabel('R,T');legend('Rpp','Rps','Tpp','Tps');
%绘制反射透射波能量曲线
figure;plot(id,IRpp,'-r',id,IRps,'--r',id,ITpp,'-g',id,ITps,'--g');grid on;
xlabel('i_d(\circ)');ylabel('I');legend('I_{Rpp}','I_{Rps}','I_{Tpp}','I_{Tps}');
%绘制入射波能量和反射透射波能量之和的曲线
figure;plot(id,Ip,'-r',id,I,'--*g');grid on;
xlabel('i_d(\circ)');ylabel('I');legend('Ip','I');
%绘制入射波能量和反射透射波能量之和的相对误差的曲线
figure;plot(id,e);grid on;
xlabel('i_d(\circ)');ylabel('e');legend('相对误差e','Location','northwest');