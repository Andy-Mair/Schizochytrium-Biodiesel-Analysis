% Define temeprature range from 0 degC to 100 degC in 5 degC steps
T=0:5:100;

% Define density of fractional carbon elements of Schizochytrium biodiesel
p14=882.7-0.7626*T;
p16=880.5-0.7438*T;
p18=878.6-0.7207*T;
p20=917.3-0.7309*T;
p225=925.3-0.7332*T;
p226=934.6-0.7354*T;

% Define fraction weights and molecular weights of carbon elements in Schizochytrium biodiesel 
w14=0.0346; M14=242.4;
w16=0.3961; M16=270.5;
w18=0.1599; M18=298.5;
w20=0.0062; M20=318.5;
w225=0.0595; M225=344.5;
w226=0.3437; M226=342.5;

% Define density function and adjusted density function of Schizochytrium biodiesel using a fractional weight adjusted density function and anchoring value
psST=((p14.*w14)+(p16.*w16)+(p18.*w18)+(p20.*w20)+(p225.*w225)+(p226.*w226))/1000;
psadST=(39.3/1000)+psST;

% Define parachor values of carbon elements making up Schizochytrium biodiesel
P14=658.4;
P16=739;
P18=819.6;
P20=839;
P225=904.3;
P226=889;

% Define Parachor value and molecular weight of Schizochytrium biodiesel using a fractional weight adjusted function
Ps=(w14*P14)+(w16*P16)+(w18*P18)+(w20*P20)+(w225*P225)+(P226*w226);
Ms=(w14*M14)+(w16*M16)+(w18*M18)+(w20*M20)+(w225*M225)+(w226*M226);

% Calculate the surface tension of Schizochytrium biodiesel 
y=((Ps.*psad)/Ms).^4; 

% Graph biodiesel surface tension as a function of temperature
plot(T,y);
