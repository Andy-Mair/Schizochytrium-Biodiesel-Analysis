L=0.4;
D=0.1:0.05:0.5;
D0=0.3;
rhoa=1.225;
rhod=840;
rhos=930;

thd=83.58*(L./D)-0.22.*(D./D0).^0.15*(rhoa/rhod).^0.26;
ths=83.58*(L./D)-0.22.*(D./D0).^0.15*(rhoa/rhos).^0.26;

plot(D,thd);
hold on;
plot(D,ths);