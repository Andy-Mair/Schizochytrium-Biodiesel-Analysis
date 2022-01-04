% Vapour pressure, diffusivity, latent heat definiions where omega is the acentric factor, Tb is the normal boling temperature,
% Tc is the critical temperature, Pc is critical pressure, Vc is critical volume, R is the gas constant, T is temp range in degC,
% Tk is temp range in degK
omegad=0.46556; omegas=0.94733;
Tbd=536.4; Tbs=644.4;
Tcd=725.6; Tcs=806;
Pcd=15.7; Pcs=12.7;
Vcd=894; Vcs=1103;
R=83.14;
T=0:20:400;
Tk=T+273.15;

% Define relationship between critical temperature, reduced temperature and current temperature 
Trd=Tk/Tcd; Trs=Tk/Tcs;

% Defines constants required for vapour pressure calculation 
AAd=5.92714-(6.09648./Trd)-(1.28862.*log(Trd))+(1.06934.*(Trd.^6));
AAs=5.92714-(6.09648./Trs)-(1.28862.*log(Trs))+(1.06934.*Trs.^6);

BBd=15.2518-(15.6875./Trd)-(13.4721.*log(Trd))+(0.43577.*(Trd.^6));
BBs=15.2518-(15.6875./Trs)-(13.4721.*log(Trs))+(0.43577.*Trs.^6);

% Defines constants for latent heat of vapourisation calculation
xxd=((Tbd/Tcd)./Trd).*((1-Trd)/(1-(Tbd/Tcd)));
xxs=((Tbs/TcB5)./Trs).*((1-Trs)/(1-(Tbs/Tcs)));

% Defines vapour pressure function for schizochytrium and diesel
Pvapd=e.^((AAd.*Trd)+(omegad.*BBd.*Trd));
Pvaps=e.^((AAs.*Trs)+(omegas.*BBs.*Trs));

% Defines latent heat of evaporation calculation for schizochytrium 
if Trd>0.6 
    Hd=R.*Tcd.*7.08*((1-Trd).^0.354+10.95.*omegad.*(1-Trd).^0.456);
else
    if Trd<1
            Hd=R.*Tcd.*7.08*((1-Trd).^0.354+10.95.*omegad.*(1-Trd).^0.456);
else 
    Hd=(R.*Tcd.*7.08*((1-(Tbd/Tcd)).^0.354+10.95.*omegad.*(1-(Tbd/Tcd)).^0.456))*(Trd./(Tbd/Tcd))*((xxd+xxd.^0.35298)/(1+xxd.^0.13856));
    end
end

% Defines latent heat of evaporation calculation for diesel
if Trs>0.6
    Hs=R.*Tcs.*7.08*((1-Trs).^0.354+10.95.*omegas.*(1-Trs).^0.456);
else
    if Trs<1
            Hs=R.*Tcs.*7.08*((1-Trs).^0.354+10.95.*omegas.*(1-Trs).^0.456);
else 
    Hs=(R.*Tcs.*7.08*((1-(Tbs/Tcs)).^0.354+10.95.*omegas.*(1-(Tbs/Tcs)).^0.456))*(Trs./(Tbs/Tcs))*((xxs+xxs.^0.35298)/(1+xxs.^0.13856));
    end
end

% Defines the majority of the vapour diffusivity denomintator calculated in the Schizochytrium_diffusivity.xlsx file
qc14=68.59383822; qc16=70.78709546; qc18=72.80847438; qc20=74.4141901; qc225=76.17711545; qc226=75.97067694; qd=63.38814929; qs=72.98819318;

% Defines the diffusion coefficient of each carbonal element of schizochytrium into air 
Dc14=(0.00143.*Tk.^1.75)./(pa6.*qc14);
Dc16=(0.00143.*Tk.^1.75)./(pa6.*qc16);
Dc18=(0.00143.*Tk.^1.75)./(pa6.*qc18);
Dc20=(0.00143.*Tk.^1.75)./(pa6.*qc20);
Dc225=(0.00143.*Tk.^1.75)./(pa6.*qc225);
Dc226=(0.00143.*Tk.^1.75)./(pa6.*qc226);

% Defines the fractional molecular weight each carbonal element accounts for in schizochytrium 
xc14=0.042756446; xc16=0.438627335; xc18=0.160458323; xc20=0.005830964; xc225=0.051735168; xc226=0.300591764;

% Defines the schizochytrium vapour diffusivity function
Ds=Dc14.*xc14+Dc16.*xc16+Dc18.*xc18+Dc20.*xc20+Dc225.*xc225+Dc226.*xc226;

% Defines diesel vapour diffusivity function
Dd=(0.00143.*Tk.^1.75)./(pa6.*qd);

% Plots diesel and schizochytrium vapour pressure, diffusivity and latent heat of evaporation over the temperature range defined
figure (10); plot (T, Pvapd); hold on; plot (T, Pvaps); hold off;
xlabel('Temperature (degC)'); ylabel('Vapour Pressure (bar)'); title('Vapour Pressure Temperature Relationship');
figure (11); plot(T, (Hd/1000000)); hold on; plot(T, (Hs/1000000)); hold off;
xlabel('Temperature (degC)'); ylabel('Latent Heat of Vapourisation (MJ/mol)'); title('Latent Heat of Vapourisation Temperature Relationship');
figure (12); plot (T, Dd); hold on; plot (T, Ds);
xlabel('Temperature (degC)'); ylabel('Vapour Diffusivity (cm^3/s)'); title('Vapour Diffusivity Temperature Relationship'); hold off;
