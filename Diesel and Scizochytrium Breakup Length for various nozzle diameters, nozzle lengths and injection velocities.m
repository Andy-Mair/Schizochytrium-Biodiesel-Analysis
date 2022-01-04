% Define various nozzles diameters
d=0.1:0.05:0.5;

% Define constants including nozzle radius, ambient pressure, diesel density, schizochytrium density, injection velocity, 
% nozzle length of injector, and air density 
r=0.05;
Pa=3e6;
rhod=840;
rhom=930;
vi=200;
L=0.4;
rhoa=1.225;

% Define function for breakup length of both fuels based on variable nozzle diameter
lbd=(7.*d).*(1+0.4.*(r./d)).*(Pa./(rhod*vi^2))^0.05.*(L./d).^0.13*(rhod/rhoa)^0.5;
lbm=(7.*d).*(1+0.4.*(r./d)).*(Pa./(rhom*vi^2))^0.05.*(L./d).^0.13*(rhom/rhoa)^0.5;

% Plots the nozzle diameter against breakup length for both fuels over specified nozzle diameters
figure (1); 
plot(d,lbd);
hold on;
plot(d,lbm);
hold off;

% Defines a fixed nozzle diameter and variable nozzle length 
d1=0.1; 
L1=0.4:0.1:2;

% Defines function for breakup length of both fuels based on variable nozzle length
lbd1=(7.*d1).*(1+(0.4.*(r./d1))).*(Pa./(rhod*vi^2))^0.05.*(L1./d1).^0.13*(rhod/rhoa)^0.5;
lbm1=(7.*d1).*(1+(0.4.*(r./d1))).*(Pa./(rhom*vi^2))^0.05.*(L1./d1).^0.13*(rhom/rhoa)^0.5;

% Plots the nozzle length against breakup length for both fuels over specified nozzle lengths
figure (2);
plot(L1,lbd1);
hold on;
plot(L1,lbm1);
hold off;

% Defines a variable injection velocity
v1=0:2:300;

% Defines function for breakup length of both fuels based on variable injection velocity
lbd1=(7*d1).*(1+0.4*(r/d1)).*(Pa./(rhod*v1.^2)).^0.05.*(L/d1)^0.13*(rhod/rhoa)^0.5;
lbm1=(7*d1).*(1+0.4*(r/d1)).*(Pa./(rhom*v1.^2)).^0.05.*(L/d1)^0.13*(rhom/rhoa)^0.5;

% Plots the injection velocity against breakup length for both fuels over specified injection velocities
figure (3);
plot(v1,lbd1);
hold on;
plot(v1,lbm1);
hold off;
