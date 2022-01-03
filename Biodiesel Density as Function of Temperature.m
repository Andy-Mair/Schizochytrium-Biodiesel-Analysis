%Define temeprature range from 0 degC to 100 degC in 5 degC steps
T=0:5:100;

%Define density of fractional carbon elements of Schizochytrium biodiesel 
p14=882.7-0.7626*T;
p16=880.5-0.7438*T;
p18=878.6-0.7207*T;
p20=917.3-0.7309*T;
p225=925.3-0.7332*T;
p226=934.6-0.7354*T;

%Define fraction weights of carbon elements in Schizochytrium biodiesel 
w14=0.0346;
w16=0.3961;
w18=0.1599;
w20=0.0062;
w225=0.0595;
w226=0.3437;

%Define density of Schizochytrium biodiesel using a fractional weight adjusted density function
ps=(p14.*w14)+(p16.*w16)+(p18.*w18)+(p20.*w20)+(p225.*w225)+(p226.*w226);

%Plot of the Schizochytrium biodiesel density againt temperature
plot(T,ps);xlabel('Temperature (degC)');ylabel('Density (kg/m^3)');title('Schizochytrium Density Temperature Relationship');
hold on;

%psad is an adjusted density function for Schizochytrium biodiesel using a measured density value at a specific temperature to anchor the function to
psad=39.3+ps;
plot (T, psad);
