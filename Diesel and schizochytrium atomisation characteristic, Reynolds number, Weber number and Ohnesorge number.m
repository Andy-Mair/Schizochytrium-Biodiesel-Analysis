% Defines constants for high temperature density relationship 
phid=(1-Trd).^(2/7)-(1-(298.15/Tcd)^(2/7));
phis=(1-Trs).^(2/7)-(1-(298.15/Tcs)^(2/7));

% Defines high temperature density relationship 
pd2=827.0338./0.9370462.^phid;
ps2=926.3171./0.939322.^phis;

% Defines constant for schizochytrium molecular weight
M14=242.4; xc14=0.042756446; 
M16=270.5; xc16=0.438627335;
M18=298.5; xc18=0.160458323;
M20=318.5; xc20=0.005830964;
M225=344.5; xc225=0.051735168;
M226=342.5; xc226=0.300591764;

% Defines diesel and schizochytrium molecular weights 
Md=189;
Ms=(xc14*M14)+(xc16*M16)+(xc18*M18)+(xc20*M20)+(xc225*M225)+(xc226*M226);

% Defines constants used to calculate kinematic viscocity for schizochytrium and diesel
Ad=10^-3.*(2.648-3.725.*Trd+1.309.*Trd.^2);
As=10^-3.*(2.648-3.725.*Trs+1.309.*Trs.^2);

Bd=10^-3.*(7.425-13.39.*Trd+5.933.*Trd.^2);
Bs=10^-3.*(7.425-13.39.*Trs+5.933.*Trs.^2);

wd=0.465559; ws=0.947334;

fd=0.176*(Tcd/Md^3/Pcd)^(1/6);
fs=0.176*(Tcs/Ms^3/Pcs)^(1/6);

% Defines the kinematic viscocity of diesel for both high temperature cases (Tr>0.7) and low temperature cases
if Trd>0.7
    nd=(Ad+wd.*Bd)./fd;
else
    nd=exp(0.1539-(1362./Tk)+(472500./Tk.^2));
end

% Defines the kinematic viscocity of schizochytrium for both high temperature cases (Tr>0.7) and low temperature cases
if Trs>0.7
    ns=(As+ws.*Bs)./fs;
else
    ns=(a1*exp(b1*T)+(c1*exp(d1*T)));
end

% Defines Reynolds number function for diesel and schizochytrium
Red=vi4.*D1./(nd./1000000);
Res=vi4.*D1./(ns./1000000);

% Defines Weber number function for diesel and schizochytrium
Wed=pd2.*vi4^2.*D1./(yd/1000);
Wes=ps2.*vi4^2.*D1./(ys/1000);

% Defines Ohnesorge number function for diesel and schizochytrium
Ohd=(nd./1000000)./(pd2.*(pd2.*D1.*(yd/1000)).^0.5);
Ohs=(ns./1000000)./(ps2.*(ps2.*D1.*(ys/1000)).^0.5);

% Defines atomisation characteristic 
Kad=((pd2.*Wed)./(rhoa1.*Red)).^(1/3);
Kas=((ps2.*Wes)./(rhoa1.*Res)).^(1/3);

%Atomisation Characteristic, Reynolds Number, Weber number and Ohnesorge number plots for diesel and schizochytrium 
figure (7); plot(T,Kad); hold on; plot(T,Kas);
xlabel('Temperature (degC)'); ylabel('Atomisation Characteristic'); title('Atomisation Characteristic Temperature Relationship');
figure (8);plot (T, log(Ohd)); hold on; plot (T, log(Ohs));
xlabel('Temperature (degC)'); ylabel('Log Ohnesorge Number'); title('Ohnesorge Number Temperature Relationship');
figure (9); plot (T, Wed); plot (T, Wes);
xlabel('Temperature (degC)'); ylabel('Weber Number'); title('Weber Number Temperature Relationship');
