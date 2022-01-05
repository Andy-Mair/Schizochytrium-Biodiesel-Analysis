%Diesel density, visco & ST where T is temperature degC, Tk is temperature degK, pd is diesel density, nd is diesel viscocity, and yd is diesel surface tension
T=0:20:400;
Tk=T+273.15;
pd=840.3-0.66331*T;
nd=exp(0.1539-(1362./Tk)+(472500./Tk.^2));
yd=43.2-0.06043*Tk;

%Algal density, visco & ST
%Density
p14=882.7-0.7626*T;
p16=880.5-0.7438*T;
p18=878.6-0.7207*T;
p20=917.3-0.7309*T;
p225=925.3-0.7332*T;
p226=934.6-0.7354*T;

w14=0.0346; M14=242.4;
w16=0.3961; M16=270.5;
w18=0.1599; M18=298.5;
w20=0.0062; M20=318.5;
w225=0.0595; M225=344.5;
w226=0.3437; M226=342.5;
xc14=0.042756446; xc16=0.438627335; xc18=0.160458323; xc20=0.005830964; xc225=0.051735168; xc226=0.300591764;


ps=(p14.*w14)+(p16.*w16)+(p18.*w18)+(p20.*w20)+(p225.*w225)+(p226.*w226);
psad=39.3+ps;

%Visco
a1=417;
b1=-0.0907;
c1=32.97;
d1=-0.01549;
ns=(a1*exp(b1*T)+(c1*exp(d1*T)));

%ST
psST=((p14.*w14)+(p16.*w16)+(p18.*w18)+(p20.*w20)+(p225.*w225)+(p226.*w226))/1000;
psadST=(39.3/1000)+psST;

P14=658.4;
P16=739;
P18=819.6;
P20=839;
P225=904.3;
P226=889;

Ps=(w14*P14)+(w16*P16)+(w18*P18)+(w20*P20)+(w225*P225)+(P226*w226);
Ms=(xc14*M14)+(xc16*M16)+(xc18*M18)+(xc20*M20)+(xc225*M225)+(xc226*M226);

ys=((Ps.*psadST)/Ms).^4; 

%B5 Blend 
pB5=(0.95.*pd)+(0.05.*psad);
e=exp(1);
nB5=e.^((0.95.*log(nd))+(0.05.*log(ns)));
yB5=((0.95.*(yd.^0.25))+(0.05.*(ys.^0.25))).^4;

%B20 Blend 
pB20=(0.8.*pd)+(0.2.*psad);
nB20=e.^((0.8.*log(nd))+(0.2.*log(ns)));
yB20=((0.8.*(yd.^0.25))+(0.2.*(ys.^0.25))).^4;

%B50 Blend 
pB50=(0.5.*pd)+(0.5.*psad);
nB50=e.^((0.5.*log(nd))+(0.5.*log(ns)));
yB50=((0.5.*(yd.^0.25))+(0.5.*(ys.^0.25))).^4;

%Density graph
figure (1); plot (T, pd);hold on; plot (T,pB5); plot (T,pB20); plot(T,pB50);plot(T,ps);
xlabel('Temperature (degC)'), ylabel('Density (kg/m^3)');title('Density vs Temperature of B0, B5, B20, B50 & B100 Fuels');

%KV graph
figure (2); plot (T, nd), hold on;plot (T,nB5);plot(T,nB20);plot(T,nB50); plot (T,ns); 
xlabel('Temperature (degC)'), ylabel('Kinematic viscosity (cSt)');title('Kinematic Viscosity vs Temperature of B0, B5, B20, B50 & B100 Fuels');hold off;

%St graph
yHFO=50.15-0.07766.*T;
figure (3); plot (T(1:21),yd(1:21));hold on; plot(T(1:21),yB5(1:21)); plot(T(1:21),yB20(1:21));plot(T(1:21),yB50(1:21)); plot(T(1:21),ys(1:21));plot(T(1:21), yHFO(1:21));ylabel('Surface Tension (mN/m)');
xlabel('Temperature (degC)'), ylabel('Surface Tension (mN/m)');title('Surface Tension vs Temperature of B0, B5, B20, B50 & B100 Fuels');hold off;

%Break up length constant
D1=0.08*10^-3;D2=0.1*10^-3;D3=0.12*10^-3;D4=0.14*10^-3;D5=0.16*10^-3;D6=0.18*10^-3;D7=0.2*10^-3; 
L1=1*10^-3; L2=2*10^-3; L3=4*10^-3; L4=8*10^-3; L5=16*10^-3; L6=32; L7=64*10^-3;
r=0.25*10^-3; 
pa1=0.1; pa2=0.5; pa3=1; pa4=2.5; pa5=5; pa6=10; pa7=20;
vi1=1; vi2=2.5; vi3=5; vi4=10; vi5=25; vi6=50; vi7=75; vi8=100; vi9=125; vi10=150; vi11=175; 
rhoa1=10; rhoa2=60; rhoa3=70; rhoa4=80; rhoa5=90; rhoa6=100; 

%Break up length vs temp L4/pa4/vi6/rhoa1/D1
Lbd=(7*D1).*(1+(.4*r/D1)).*(pa4./(pd.*vi6^2)).^0.05.*(L4/D1).^0.13.*(pd./rhoa1).^0.5;
LbB5=(7*D1).*(1+(.4*r/D1)).*(pa4./(pB5.*vi6^2)).^0.05.*(L4/D1).^0.13.*(pB5./rhoa1).^0.5;
LbB20=(7*D1).*(1+(.4*r/D1)).*(pa4./(pB20.*vi6^2)).^0.05.*(L4/D1).^0.13.*(pB20./rhoa1).^0.5;
LbB50=(7*D1).*(1+(.4*r/D1)).*(pa4./(pB50.*vi6^2)).^0.05.*(L4/D1).^0.13.*(pB50./rhoa1).^0.5;
Lbs=(7*D1).*(1+(.4*r/D1)).*(pa4./(ps.*vi6^2)).^0.05.*(L4/D1).^0.13.*(ps./rhoa1).^0.5;

%LbPlots
figure(4); plot (T, 1000*Lbd); hold on; plot(T,1000*LbB5); plot(T,1000*LbB20); plot(T,1000*LbB50); plot(T,1000*Lbs);
hold off; xlabel('Temperature (degC)');ylabel('Break-Up Length (mm)');title('Break Up Length Temperature Relationship');

%Spray angle vs temp L4/pa4/vi6/rhoa1/D1
Do=1*10^-3;
thetad=83.5.*(L4/D1)^-0.22.*(D1/Do)^0.15.*(rhoa1./pd).^0.26;
thetaB5=83.5.*(L4/D1)^-0.22.*(D1/Do)^0.15.*(rhoa1./pB5).^0.26;
thetaB20=83.5.*(L4/D1)^-0.22.*(D1/Do)^0.15.*(rhoa1./pB20).^0.26;
thetaB50=83.5.*(L4/D1)^-0.22.*(D1/Do)^0.15.*(rhoa1./pB50).^0.26;
thetas=83.5.*(L4/D1)^-0.22.*(D1/Do)^0.15.*(rhoa1./ps).^0.26;

%Spray angle plot
figure(5); plot(T,thetad); hold on; plot(T,thetaB5); plot(T, thetaB20);plot(T,thetaB50);plot(T, thetas);
hold off; xlabel('Temperature (degC)'); ylabel('Spray Angle (deg)'); title('Spray Angle Temperature Relationship');

%Spray tip penetration
t=0*10^-3:1*10^-3:20*10^-3;
Pi=50;
tbd=28.65.*((D1.*pd(6))/(rhoa1*(Pi-pa4))^0.5);
if t<tbd
    Sd=0.39.*t.*(2.*(Pi-pa4)./pd(6)).^0.5;
else
    Sd=2.95.*(2.*(Pi-pa4)/rhoa1).^0.5;
end

tbB5=28.65.*((D1.*pB5(6))./(rhoa1*(Pi-pa4))^0.5);
if t<tbB5
    SB5=0.39.*t.*(2.*(Pi-pa4)./pB5(6)).^0.5;
else
    SB5=2.95.*(2.*(Pi-pa4)/rhoa1).^0.5;
end

tbB20=28.65.*((D1.*pB20(6))/(rhoa1*(Pi-pa4))^0.5);
if t<tbB20
    SB20=0.39.*t.*(2.*(Pi-pa4)./pB20(6)).^0.5;
else
    SB20=2.95.*(2.*(Pi-pa4)/rhoa1).^0.5;
end

tbB50=28.65.*((D1.*pB50(6))/(rhoa1*(Pi-pa4))^0.5);
if t<tbB50
    SB50=0.39.*t.*(2.*(Pi-pa4)./pB50(6)).^0.5;
else
    SB50=2.95.*(2.*(Pi-pa4)/rhoa1).^0.5;
end

tbs=28.65.*((D1.*ps(6))/(rhoa1*(Pi-pa4))^0.5);
if t<tbs
    Ss=0.39.*t.*(2.*(Pi-pa4)./ps(6)).^0.5;
else
    Ss=2.95.*(2.*(Pi-pa4)/rhoa1).^0.5;
end

% Spray tip penetration graphs
figure (6);plot(t,1000*Sd);hold on;plot (t,1000*SB20);plot (t, 1000*Ss);
hold off; xlabel('Time (s)'); ylabel('Spray Penetration (mm)'); title('Spray penetration Temperature Relationship');

%Suater mean diameter
SMDd=6156.*(nd/10^6).^0.385.*(yd/1000).^0.737.*pd.^0.737.*rhoa1^0.06*((Pi-pa4)*10)^-0.54;
SMDB5=6156.*(nB5/10^6).^0.385.*(yB5/1000).^0.737.*pB5.^0.737.*rhoa1^0.06*((Pi-pa4)*10)^-0.54;
SMDB20=6156.*(nB20/10^6).^0.385.*(yB20/1000).^0.737.*pB20.^0.737.*rhoa1^0.06*((Pi-pa4)*10)^-0.54;
SMDB50=6156.*(nB50/10^6).^0.385.*(yB50/1000).^0.737.*pB50.^0.737.*rhoa1^0.06*((Pi-pa4)*10)^-0.54;
SMDs=6156.*(ns/10^6).^0.385.*(ys/1000).^0.737.*ps.^0.737.*rhoa1^0.06*((Pi-pa4)*10)^-0.54;

%SMD plots
figure(7); plot (T, SMDd); hold on; plot (T, SMDB5);plot (T, SMDB20);plot (T, SMDB50);plot (T, SMDs);hold off;
xlabel('Temperature (degC)'); ylabel('Sauter Mean Diameter'); title('Sauter Mean Diameter Temperature Relationship');



%Vapour pressure, diffusivity, latent heat definiions 
omegad=0.46556; omegaB5=0.533303; omegaB20=0.60936; omegaB50=0.75125; omegas=0.94733;
Tbd=536.4; TbB5=544.8; TbB20=567.3; TbB50=603; Tbs=644.4;
Tcd=725.6; TcB5=732.6; TcB20=750.5; TcB50=777.2; Tcs=806;
Pcd=15.7; PcB5=16.6; PcB20=15.7; PcB50=14.3; Pcs=12.7;
Vcd=894; VcB5=909.8; VcB20=952.4; VcB50=1021.1; Vcs=1103;
R=83.14;

Trd=Tk/Tcd; TrB5=Tk/TcB5; TrB20=Tk/TcB20;TrB50=Tk/TcB50;Trs=Tk/Tcs;
AAd=5.92714-(6.09648./Trd)-(1.28862.*log(Trd))+(1.06934.*(Trd.^6));
AAB5=5.92714-(6.09648./TrB5)-(1.28862.*log(TrB5))+(1.06934.*TrB5.^6);
AAB20=5.92714-(6.09648./TrB20)-(1.28862.*log(TrB20))+(1.06934.*TrB20.^6);
AAB50=5.92714-(6.09648./TrB50)-(1.28862.*log(TrB50))+(1.06934.*TrB50.^6);
AAs=5.92714-(6.09648./Trs)-(1.28862.*log(Trs))+(1.06934.*Trs.^6);

BBd=15.2518-(15.6875./Trd)-(13.4721.*log(Trd))+(0.43577.*(Trd.^6));
BBB5=15.2518-(15.6875./TrB5)-(13.4721.*log(TrB5))+(0.43577.*TrB5.^6);
BBB20=15.2518-(15.6875./TrB20)-(13.4721.*log(TrB20))+(0.43577.*TrB20.^6);
BBB50=15.2518-(15.6875./TrB50)-(13.4721.*log(TrB50))+(0.43577.*TrB50.^6);
BBs=15.2518-(15.6875./Trs)-(13.4721.*log(Trs))+(0.43577.*Trs.^6);

xxd=((Tbd/Tcd)./Trd).*((1-Trd)/(1-(Tbd/Tcd)));
xxB5=((TbB5/TcB5)./TrB5).*((1-TrB5)/(1-(TbB5/TcB5)));
xxB20=((TbB20/TcB5)./TrB20).*((1-TrB20)/(1-(TbB20/TcB20)));
xxB50=((TbB50/TcB5)./TrB50).*((1-TrB50)/(1-(TbB50/TcB50)));
xxs=((Tbs/TcB5)./Trs).*((1-Trs)/(1-(Tbs/Tcs)));

%Vapour pressure, diffusivity, latent heat calcs
PvapHFO=2.715*10^-7*e.^(0.03183*T);
Pvapd=e.^((AAd.*Trd)+(omegad.*BBd.*Trd));
PvapB5=e.^((AAB5.*TrB5)+(omegaB5.*BBB5.*TrB5));
PvapB20=e.^((AAB20.*TrB20)+(omegaB20.*BBB20.*TrB20));
PvapB50=e.^((AAB50.*TrB50)+(omegaB50.*BBB50.*TrB50));
Pvaps=e.^((AAs.*Trs)+(omegas.*BBs.*Trs));

if Trd>0.6 
    Hd=R.*Tcd.*7.08*((1-Trd).^0.354+10.95.*omegad.*(1-Trd).^0.456);
else
    if Trd<1
            Hd=R.*Tcd.*7.08*((1-Trd).^0.354+10.95.*omegad.*(1-Trd).^0.456);
else 
    Hd=(R.*Tcd.*7.08*((1-(Tbd/Tcd)).^0.354+10.95.*omegad.*(1-(Tbd/Tcd)).^0.456))*(Trd./(Tbd/Tcd))*((xxd+xxd.^0.35298)/(1+xxd.^0.13856));
    end
end

if TrB5>0.6 
    HB5=R.*TcB5.*7.08*((1-TrB5).^0.354+10.95.*omegaB5.*(1-TrB5).^0.456);
else
    if TrB5<1
            HB5=R.*TcB5.*7.08*((1-TrB5).^0.354+10.95.*omegaB5.*(1-TrB5).^0.456);
else 
    HB5=(R.*TcB5.*7.08*((1-(TbB5/TcB5)).^0.354+10.95.*omegaB5.*(1-(TbB5/TcB5)).^0.456))*(TrB5./(TbB5/TcB5))*((xxB5+xxB5.^0.35298)/(1+xxB5.^0.13856));
    end
end

if TrB20>0.6
    HB20=R.*TcB20.*7.08*((1-TrB20).^0.354+10.95.*omegaB20.*(1-TrB20).^0.456);
else
    if TrB20<1
            HB20=R.*TcB20.*7.08*((1-TrB20).^0.354+10.95.*omegaB20.*(1-TrB20).^0.456);
else 
    HB20=(R.*TcB20.*7.08*((1-(TbB20/TcB20)).^0.354+10.95.*omegaB20.*(1-(TbB20/TcB20)).^0.456))*(TrB20./(TbB20/TcB20))*((xxB20+xxB20.^0.35298)/(1+xxB20.^0.13856));
    end
end
if TrB50>0.6
    HB50=R.*TcB50.*7.08*((1-TrB50).^0.354+10.95.*omegaB50.*(1-TrB50).^0.456);
else
    if TrB50<1
            HB50=R.*TcB50.*7.08*((1-TrB50.^0.354+10.95.*omegaB50.*(1-TrB50).^0.456));
else 
    HB50=(R.*TcB50.*7.08*((1-(TbB50/TcB50)).^0.354+10.95.*omegaB50.*(1-(TbB50/TcB50)).^0.456))*(TrB50./(TbB50/TcB50))*((xxB50+xxB50.^0.35298)/(1+xxB50.^0.13856));
    end
end

if Trs>0.6
    Hs=R.*Tcs.*7.08*((1-Trs).^0.354+10.95.*omegas.*(1-Trs).^0.456);
else
    if Trs<1
            Hs=R.*Tcs.*7.08*((1-Trs).^0.354+10.95.*omegas.*(1-Trs).^0.456);
else 
    Hs=(R.*Tcs.*7.08*((1-(Tbs/Tcs)).^0.354+10.95.*omegas.*(1-(Tbs/Tcs)).^0.456))*(Trs./(Tbs/Tcs))*((xxs+xxs.^0.35298)/(1+xxs.^0.13856));
    end
end
HHFO=149.8-0.188.*T;

qc14=68.59383822; qc16=70.78709546; qc18=72.80847438; qc20=74.4141901; qc225=76.17711545; qc226=75.97067694; qd=63.38814929; qs=72.98819318;

Dc14=(0.00143.*Tk.^1.75)./(pa6.*qc14);
Dc16=(0.00143.*Tk.^1.75)./(pa6.*qc16);
Dc18=(0.00143.*Tk.^1.75)./(pa6.*qc18);
Dc20=(0.00143.*Tk.^1.75)./(pa6.*qc20);
Dc225=(0.00143.*Tk.^1.75)./(pa6.*qc225);
Dc226=(0.00143.*Tk.^1.75)./(pa6.*qc226);

xc14=0.042756446; xc16=0.438627335; xc18=0.160458323; xc20=0.005830964; xc225=0.051735168; xc226=0.300591764;
xdB5=0.923018; xsB5=1-xdB5; xdB20=0.716248; xsB20=1-xdB20; xdB50=0.386899; xsB50=1-xdB50; 

Ds=Dc14.*xc14+Dc16.*xc16+Dc18.*xc18+Dc20.*xc20+Dc225.*xc225+Dc226.*xc226;
Dd=(0.00143.*Tk.^1.75)./(pa6.*qd);

DB5=Ds*xsB5+Dd*xdB5;
DB20=Ds*xsB20+Dd*xdB20;
DB50=Ds*xsB50+Dd*xdB50;

figure (10); plot (T, Pvapd); hold on; plot (T, PvapB5);plot (T, PvapB20);plot (T, PvapB50);plot (T, Pvaps); plot (T, PvapHFO);hold off;
xlabel('Temperature (degC)'); ylabel('Vapour Pressure (bar)'); title('Vapour Pressure Temperature Relationship');
figure (11); plot(T, (Hd/1000000));hold on; plot(T, (HB5/1000000)); plot(T, (HB20/1000000)); plot(T, (HB50/1000000)); plot(T, (Hs/1000000));plot (T, ((4186.79999*10).*HHFO./1000000)); hold off;
xlabel('Temperature (degC)'); ylabel('Latent Heat of Vapourisation (MJ/mol)'); title('Latent Heat of Vapourisation Temperature Relationship');
figure (12); plot (T, Dd); hold on; plot (T, DB5);plot (T, DB20);plot (T, DB50);plot (T, Ds);
xlabel('Temperature (degC)'); ylabel('Vapour Diffusivity (cm^3/s)'); title('Vapour Diffusivity Temperature Relationship'); hold off;

%HFO Dyn Visc
HFOu=1382*e.^(-0.01937.*T);
Su=(psad/1000).*ns;
figure(13); plot(T(1:21), HFOu(1:21));hold on; plot(T(1:21),Su(1:21));xlabel('Temperature (degC)'); ylabel('Dynamic Viscosity (cP)'); title('Dynamic Viscosity Temperature Relationship'); hold off;

%Atomisation characteristic, Reynolds number, Weber numbe and OH number
phid=(1-Trd).^(2/7)-(1-(298.15/Tcd)^(2/7));
phiB5=(1-TrB5).^(2/7)-(1-(298.15/TcB5)^(2/7));
phiB20=(1-TrB20).^(2/7)-(1-(298.15/TcB20)^(2/7));
phiB50=(1-TrB50).^(2/7)-(1-(298.15/TcB50)^(2/7));
phis=(1-Trs).^(2/7)-(1-(298.15/Tcs)^(2/7));

pd2=827.0338./0.9370462.^phid;
pB52=831.998./0.937243.^phiB5;
pB202=846.8905./0.937744.^phiB20;
pB502=876.6754./0.938492.^phiB50;
ps2=926.3171./0.939322.^phis;

Md=189; MB5=194.725; MB20=211.9; MB50=246.25;

Ad=10^-3.*(2.648-3.725.*Trd+1.309.*Trd.^2);
AB5=10^-3.*(2.648-3.725.*TrB5+1.309.*TrB5.^2);
AB20=10^-3.*(2.648-3.725.*TrB20+1.309.*TrB20.^2);
AB50=10^-3.*(2.648-3.725.*TrB50+1.309.*TrB50.^2);
As=10^-3.*(2.648-3.725.*Trs+1.309.*Trs.^2);

Bd=10^-3.*(7.425-13.39.*Trd+5.933.*Trd.^2);
BB5=10^-3.*(7.425-13.39.*TrB5+5.933.*TrB5.^2);
BB20=10^-3.*(7.425-13.39.*TrB20+5.933.*TrB20.^2);
BB50=10^-3.*(7.425-13.39.*TrB50+5.933.*TrB50.^2);
Bs=10^-3.*(7.425-13.39.*Trs+5.933.*Trs.^2);

wd=0.465559; wB5=0.533898; wB20=0.61933; wB50=0.75405; ws=0.947334;

fd=0.176*(Tcd/Md^3/Pcd)^(1/6);
fB5=0.176*(TcB5/MB5^3/PcB5)^(1/6);
fB20=0.176*(TcB20/MB20^3/PcB20)^(1/6);
fB50=0.176*(TcB50/MB50^3/PcB50)^(1/6);
fs=0.176*(Tcs/Ms^3/Pcs)^(1/6);


if Trd>0.7
    nd=(Ad+wd.*Bd)./fd;
else
    nd=exp(0.1539-(1362./Tk)+(472500./Tk.^2));
end

if TrB5>0.7
    nB5=(AB5+wB5.*BB5)./fB5;
else
    nB5=e.^((0.95.*log(nd))+(0.05.*log(ns)));
end

if TrB20>0.7
    nB20=(AB20+wB20.*BB20)./fB20;
else
    nB20=e.^((0.8.*log(nd))+(0.2.*log(ns)));
end

if TrB50>0.7
    nB50=(AB50+wB50.*BB50)./fB50;
else
    nB50=e.^((0.5.*log(nd))+(0.5.*log(ns)));
end

if Trs>0.7
    ns=(As+ws.*Bs)./fs;
else
    ns=(a1*exp(b1*T)+(c1*exp(d1*T)));
end

Red=vi4.*D1./(nB5./1000000);
ReB5=vi4.*D1./(nB5./1000000);
ReB20=vi4.*D1./(nB20./1000000);
ReB50=vi4.*D1./(nB50./1000000);
Res=vi4.*D1./(ns./1000000);

Wed=pd2.*vi4^2.*D1./(yd/1000);
WeB5=pB52.*vi4^2.*D1./(yB5/1000);
WeB20=pB202.*vi4^2.*D1./(yB20/1000);
WeB50=pB502.*vi4^2.*D1./(yB50/1000);
Wes=ps2.*vi4^2.*D1./(ys/1000);

Ohd=(nd./1000000)./(pd2.*(pd2.*D1.*(yd/1000)).^0.5);
OhB5=(nB5./1000000)./(pB52.*(pB52.*D1.*(yB5/1000)).^0.5);
OhB20=(nB20./1000000)./(pB202.*(pB202.*D1.*(yB20/1000)).^0.5);
OhB50=(nB50./1000000)./(pB502.*(pB502.*D1.*(yB50/1000)).^0.5);
Ohs=(ns./1000000)./(ps2.*(ps2.*D1.*(ys/1000)).^0.5);

Kad=((pd2.*Wed)./(rhoa1.*Red)).^(1/3);
KaB5=((pB52.*WeB5)./(rhoa1.*ReB5)).^(1/3);
KaB20=((pB202.*WeB20)./(rhoa1.*ReB20)).^(1/3);
KaB50=((pB502.*WeB50)./(rhoa1.*ReB50)).^(1/3);
Kas=((ps2.*Wes)./(rhoa1.*Res)).^(1/3);

%Atomisation Characteristics plots
figure (7); plot(T,Kad); hold on; plot(T,KaB5);plot(T,KaB20);plot(T,KaB50);plot(T,Kas);
xlabel('Temperature (degC)'); ylabel('Atomisation Characteristic'); title('Atomisation Characteristic Temperature Relationship');
figure (8);plot (T, log(Ohd)); hold on; plot (T, log(OhB5));plot (T, log(OhB20));plot (T, log(OhB50));plot (T, log(Ohs));
xlabel('Temperature (degC)'); ylabel('Log Ohnesorge Number'); title('Ohnesorge Number Temperature Relationship');
figure (9); plot (T, Wed); hold on; plot (T, WeB5);plot (T, WeB20);plot (T, WeB50);plot (T, Wes);
xlabel('Temperature (degC)'); ylabel('Weber Number'); title('Weber Number Temperature Relationship');
