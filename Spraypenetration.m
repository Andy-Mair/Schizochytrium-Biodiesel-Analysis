D=0.2e-3;
rhoa=1.225;
rhod=840;
rhos=930;
Pinj1=0.7;
Pinj2=1;
Pinj3=5;
Pinj4=10;
Pinj5=25;
Pinj6=50;
Pamb=0.4;
t=0:0.1:10;

tbd1=28.65*(rhod*D/sqrt(rhoa*(Pinj1-Pamb)));
if t<tbd1
    Sd1=0.39*sqrt((2*(Pinj1-Pamb))/rhod).*t;
else
    Sd1=2.95*((Pinj1-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbd2=28.65*(rhod*D/sqrt(rhoa*(Pinj2-Pamb)));
if t<tbd2
    Sd2=0.39*sqrt((2*(Pinj2-Pamb))/rhod).*t;
else
    Sd2=2.95*((Pinj2-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbd3=28.65*(rhod*D/sqrt(rhoa*(Pinj3-Pamb)));
if t<tbd3
    Sd3=0.39*sqrt((2*(Pinj3-Pamb))/rhod).*t;
else
    Sd3=2.95*((Pinj3-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end


tbd4=28.65*(rhod*D/sqrt(rhoa*(Pinj4-Pamb)));
if t<tbd4
    Sd4=0.39*sqrt((2*(Pinj4-Pamb))/rhod).*t;
else
    Sd4=2.95*((Pinj4-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbd5=28.65*(rhod*D/sqrt(rhoa*(Pinj5-Pamb)));
if t<tbd4
    Sd5=0.39*sqrt((2*(Pinj5-Pamb))/rhod).*t;
else
    Sd5=2.95*((Pinj5-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end


tbs1=28.65*(rhos*D/sqrt(rhoa*(Pinj1-Pamb)));
if t<tbs1
    Ss1=0.39*sqrt((2*(Pinj1-Pamb))/rhos).*t;
else
    Ss1=2.95*((Pinj1-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbs2=28.65*(rhos*D/sqrt(rhoa*(Pinj2-Pamb)));
if t<tbs2
    Ss2=0.39*sqrt((2*(Pinj2-Pamb))/rhos).*t;
else
    Ss2=2.95*((Pinj2-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbs3=28.65*(rhos*D/sqrt(rhoa*(Pinj3-Pamb)));
if t<tbs3
    Ss3=0.39*sqrt((2*(Pinj3-Pamb))/rhos).*t;
else
    Ss3=2.95*((Pinj3-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end


tbs4=28.65*(rhos*D/sqrt(rhoa*(Pinj4-Pamb)));
if t<tbs4
    Ss4=0.39*sqrt((2*(Pinj4-Pamb))/rhos).*t;
else
    Ss4=2.95*((Pinj4-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end

tbs5=28.65*(rhos*D/sqrt(rhoa*(Pinj5-Pamb)));
if t<tbd4
    Ss5=0.39*sqrt((2*(Pinj5-Pamb))/rhos).*t;
else
    Ss5=2.95*((Pinj5-Pamb)/rhoa)^0.25*(D.*t).^0.5;
end


figure(1); plot(t,1000*Sd1, 'red');hold on; plot(t,1000*Sd2, 'red'); xlabel ('Time (ms)'); ylabel('Spray penetration (mm)'); title('Spray penetration Against Time for Varied Injection Pressures'); 
plot(t,1000*Sd3,'red');plot(t,1000*Sd4, 'red');plot(t,1000*Sd5,'red'); hold off
figure (2);plot(t,1000*Ss1, 'blue');hold on; plot(t,1000*Ss2,'blue'); xlabel ('Time (ms)'); ylabel('Spray penetration (mm)'); title('Spray penetration Against Time for Varied Injection Pressures'); 
plot(t,1000*Ss3,'blue');plot(t,1000*Ss4, 'blue');plot(t,1000*Ss5, 'blue');