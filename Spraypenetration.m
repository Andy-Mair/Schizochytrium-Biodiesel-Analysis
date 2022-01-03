% Defines injection nozzle diameter
D=0.2e-3;

% Defines air density 
rhoa=1.225;

% Defines diesel and Schizochytrium densities
rhod=840;
rhos=930;

% Defines a range of injection pressures 
Pinj1=0.7;
Pinj2=1;
Pinj3=5;
Pinj4=10;
Pinj5=25;

% Defines the ambient injection pressure 
Pamb=0.4;

% Defines spray time period from 0 s to 10 s in 0.1 s steps
t=0:0.1:10;

% Defines the spray tip penetration for diesel under injection pressure 1
tbd1=28.65*(rhod*D/sqrt(rhoa*(Pinj1-Pamb)));
if t<tbd1
    Sd1=0.39*sqrt((2*(Pinj1-Pamb))/rhod).*t;
else
    Sd1=2.95*((Pinj1-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for diesel under injection pressure 2
tbd2=28.65*(rhod*D/sqrt(rhoa*(Pinj2-Pamb)));
if t<tbd2
    Sd2=0.39*sqrt((2*(Pinj2-Pamb))/rhod).*t;
else
    Sd2=2.95*((Pinj2-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for diesel under injection pressure 3
tbd3=28.65*(rhod*D/sqrt(rhoa*(Pinj3-Pamb)));
if t<tbd3
    Sd3=0.39*sqrt((2*(Pinj3-Pamb))/rhod).*t;
else
    Sd3=2.95*((Pinj3-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for diesel under injection pressure 4
tbd4=28.65*(rhod*D/sqrt(rhoa*(Pinj4-Pamb)));
if t<tbd4
    Sd4=0.39*sqrt((2*(Pinj4-Pamb))/rhod).*t;
else
    Sd4=2.95*((Pinj4-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for diesel under injection pressure 5
tbd5=28.65*(rhod*D/sqrt(rhoa*(Pinj5-Pamb)));
if t<tbd4
    Sd5=0.39*sqrt((2*(Pinj5-Pamb))/rhod).*t;
else
    Sd5=2.95*((Pinj5-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for Schizochtrium under injection pressure 1
tbs1=28.65*(rhos*D/sqrt(rhoa*(Pinj1-Pamb)));
if t<tbs1
    Ss1=0.39*sqrt((2*(Pinj1-Pamb))/rhos).*t;
else
    Ss1=2.95*((Pinj1-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for Schizochtrium under injection pressure 2
tbs2=28.65*(rhos*D/sqrt(rhoa*(Pinj2-Pamb)));
if t<tbs2
    Ss2=0.39*sqrt((2*(Pinj2-Pamb))/rhos).*t;
else
    Ss2=2.95*((Pinj2-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for Schizochtrium under injection pressure 3
tbs3=28.65*(rhos*D/sqrt(rhoa*(Pinj3-Pamb)));
if t<tbs3
    Ss3=0.39*sqrt((2*(Pinj3-Pamb))/rhos).*t;
else
    Ss3=2.95*((Pinj3-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for Schizochtrium under injection pressure 4
tbs4=28.65*(rhos*D/sqrt(rhoa*(Pinj4-Pamb)));
if t<tbs4
    Ss4=0.39*sqrt((2*(Pinj4-Pamb))/rhos).*t;
else
    Ss4=2.95*((Pinj4-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Defines the spray tip penetration for Schizochtrium under injection pressure 5
tbs5=28.65*(rhos*D/sqrt(rhoa*(Pinj5-Pamb)));
if t<tbd4
    Ss5=0.39*sqrt((2*(Pinj5-Pamb))/rhos).*t;
else
    Ss5=2.95*((Pinj5-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

% Plots a graph of spray tip penetration against time for varied injection pressures for both diesel and schizochytrium with the spray penetration scaled to maatch mm units
figure(1); plot(t,1000*Sd1, 'red');hold on; plot(t,1000*Sd2, 'red'); xlabel ('Time (ms)'); ylabel('Spray penetration (mm)'); title('Spray penetration Against Time for Varied Injection Pressures'); 
plot(t,1000*Sd3,'red');plot(t,1000*Sd4, 'red');plot(t,1000*Sd5,'red'); hold off
figure (2);plot(t,1000*Ss1, 'blue');hold on; plot(t,1000*Ss2,'blue'); xlabel ('Time (ms)'); ylabel('Spray penetration (mm)'); title('Spray penetration Against Time for Varied Injection Pressures'); 
plot(t,1000*Ss3,'blue');plot(t,1000*Ss4, 'blue');plot(t,1000*Ss5, 'blue');
