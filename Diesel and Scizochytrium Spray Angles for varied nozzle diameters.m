% Defines nozzle length, range of nozzle diameters, nozzle-sac chamber diameter, air density, diesel density and schizochytrium biodiesel density
L=0.4;
D=0.1:0.05:0.5;
D0=0.3;
rhoa=1.225;
rhod=840;
rhos=930;

% Defines and calculates the injection angle for varying nozzle diameters for diesel and schizochytrium
thd=83.58*(L./D)-0.22.*(D./D0).^0.15*(rhoa/rhod).^0.26;
ths=83.58*(L./D)-0.22.*(D./D0).^0.15*(rhoa/rhos).^0.26;

% Plots the spray angle against nozzle diameter for schizochytrium and diesel 
plot(D,thd);
hold on;
plot(D,ths);
