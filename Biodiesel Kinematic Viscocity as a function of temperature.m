%Reads in experimental measured values for temperature and kinematic viscocity 
t=(AlgalKinematicVisco.t);
m=(AlgalKinematicVisco.mm);

% Defines a plot of 2 differing fitting models to determine a kinematic viscocity temperature function 
figure (1);scatter(t,m);xlabel('Temperature (degC)');ylabel('Kinematic Viscocity (cSt)');title ('Schizochytrium Kinematic Viscosity Temperature Relationship');hold on;
a=0.04882;
b=230.8;
c=-4218;
T=20:5:120;
mfit=exp(a+(b./T)+(c./T.^2));

a1=417;
b1=-0.0907;
c1=32.97;
d1=-0.01549;
nfit=(a1*exp(b1*T)+(c1*exp(d1*T)));

% Plots the fitting functions against temperature
plot (T, mfit);
plot (T, nfit);
