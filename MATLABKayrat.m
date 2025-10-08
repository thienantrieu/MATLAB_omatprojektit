%Olio_ohjelmoinnin harjoitustyö MATLAB edition
%Sää sovellus
clearvars
close all
clc

prompt = {'Hae sääennuste Suomeen tai ulkomaille:'};
dlgtitle = 'Sää';
fieldsize = [1 45];
definput = {''};
answer = inputdlg(prompt, dlgtitle,fieldsize,definput);
url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/?key=INSERT_OWN_API_KEY';
url = insertAfter(url,'timeline/',string(answer));

weather = webread(url);
dates = datetime([weather.days.datetimeEpoch], 'convertfrom', 'posixtime', 'Format', 'MM/dd/yy');

ftemps = [weather.days.temp];  %Fahrenheit
ctemps = (ftemps-32)*5/9;      %Celsius
curtemp = (weather.currentConditions.temp-32)*5/9;
paine = 'Ilmanpaine: hPa';
paine = insertAfter(paine, 'Ilmanpaine: ',string(weather.currentConditions.pressure));
ltila = 'Lämpötila: C';
ltila = insertAfter(ltila, 'Lämpötila: ',string(curtemp));
tuuli = 'Tuulennopeus: m/s';
tuuli = insertAfter(tuuli, 'Tuulennopeus: ', string(weather.currentConditions.windspeed));

maxlampo = weather.days.tempmax;
maxlampo = (maxlampo-32)*5/9;
maxlampostr = 'Päivän korkein lämpötila: C';
maxlampostr = insertAfter(maxlampostr, 'lämpötila: ', string(maxlampo));

minlampo = weather.days.tempmin;
minlampo = (minlampo-32)*5/9;
minlampostr = 'Päivän alin lämpötila: C';
minlampostr = insertAfter(minlampostr, 'lämpötila: ', string(minlampo));


dim = [.2 .5 .4 .4];
str = {weather.resolvedAddress,weather.description, ltila,maxlampostr,minlampostr, tuuli, paine, weather.currentConditions.conditions};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
plot(dates, ctemps);
title('Sää');
ylabel('Celsius')
grid on
%Pori
%Kemi
%%
clearvars
close all
clc

a = 1;
b = 52.4;
c = 25;

a = 7.6;
b = 15;
c = 0;

t = 0:0.001:50;
x = cos(a.*t) + cos(b.*t)./2 + sin(c.*t)./3;
y = sin(a.*t) + sin(b.*t)./2 + cos(c.*t)./3;
p = 0.99;

comet(x,y,p)

%%
%polaarikäyrä versio
clearvars 
close all
clc

t = 0:0.1:100*pi;
r = 4*sin((24*t)/25)+10;

polarplot(t,r)
%%
clearvars
close all 
clc

t = 0:0.1:100*pi;
r = sin((24*t)/25);

polarplot(t,r)
%%
%Sydän

clearvars
close all
clc

t = 0:0.001:2*pi;
x = 16*sin(t).^3;
y = 13*cos(t) -5*cos(2*t) - 2*cos(3*t) - cos(4*t);
p = 0.99;

comet(x,y,p)

%%
%Spiraali

clearvars
close all
clc

t = 0:0.001:2*pi;
x = -sin(20*t) .* tan(t/10);
y = -cos(20*t) .* tan(t/10);
p = 0.99; 

comet(x,y,p)

%%
clearvars
close all
clc

t = -100:0.01:100;


x = 6.*sin(10.24.*t).*cos(cos(1.7.*t));
y = 6.*cos(10.24.*t).^4.*sin(sin(1.7.*t));
p = 0.5;

comet(x, y,p)

%%
clearvars
close all
clc

a = 0.1;
b = 0.1;
t = 0:0.1:2*pi;

x = (a + b).*cos(t) - b.*cos((a./b + 1).*t);
y = (a + b).*sin(t) - b.*sin((a./b + 1).*t);
p = 0.90;

comet(x,y,p)

%%
clearvars
close all
clc

t = 0:0.1:20*pi;

x = 7*sin(t)+ 4*sin(3.375*t);
y = 35*cos(t)+ 4*cos(3.375*t);
p = 0.90;

comet(x,y,p)
%%
clearvars
close all
clc

t = 0:0.1:7*pi;

x = 8*cos(t)-6*(cos((8*t)/3));
y = 8*sin(t)-6*(sin((8*t)/3));
p = 0.90;

comet(x,y,p)

%%
clearvars
close all
clc

t = 0:0.1:10*pi;

x = 13*cos(t)-5*cos(2.6*t);
y = 13*sin(t)-5*sin(2.6*t);
p = 0.90;

comet(x,y,p)
%%
%Tähti

clearvars
close all
clc

t = 0:0.1:7*pi;

x = 2*cos(t)+5*(cos((2*t)/3));
y = 2*sin(t)-5*(sin((2*t)/3));
p = 0.90;

comet(x,y,p)

%%
clearvars
close all
clc

t = 0:0.1:4*pi;

x = 2*sin(2*t);
y = 2*cos(3*t);
p = 0.90;

comet(x,y,p)

%%
clearvars
close all
clc

t = 0:0.1:10*pi;

x = 2*sin(t)+0.6*(cos(2.8*t));
y = 2*cos(t);
p = 0.90;

comet(x,y,p)

%%
%Lissajous käyrä

clearvars
close all
clc

a = 5;
b = 4;
c = pi/4;
n = 10;

%n=1
%c=0 suora

%n=1
%c=pi/2 ellipsi

%n=2
%c=pi/2 käyrä



t = -200:0.1:200;

x = a.*sin(n.*t+c);
y = b.*sin(t);
p = 0.90;

comet(x,y,p)

%%
%Random käyrä generaattori

clearvars
close all
clc

set(gcf,'color','w');
axis equal off;
hold on
for P=1:5
   for Q=1:5
      V=ceil(9*rand(1,3));
      a=V(1);
      b=V(2);
      c=V(3);
      L=a*b*c;
      S=zeros(1,L+1);
      for n=0:L
         m=n/a+(n^2)/b+(n^3)/c;
         S(n+1)=exp(2*pi*1i*m);
      end
      S=cumsum(S);
      M=mean(S);
      S=S-M;
      R=max(abs(S));
      S=S/R;
      shi=3*(P+1i*Q);
      plot(shi+S);
      text(real(shi),-1.5+imag(shi),num2str(V),'horizontalalignment','center');
   end
end
%%
%Sydän

clearvars
close all
clc

f = @(x, y, z) (x.^2+(9/4).*y.^2+z.^2-1).^3-x.^2.*z.^3-(9./80).*y.^2.*z.^3;
[x, y, z] = meshgrid(linspace(-3, 3));
val = f(x, y, z);
[p, v] = isosurface(x, y, z, val, 0);
patch('faces', p, 'vertices', v, 'facevertexcdata', jet(size(v, 1)), 'facecolor', 'w', 'edgecolor', 'flat');
view(3)
axis image

%%
%Polaarikäyrät

clearvars
close all
clc

t = 0:0.01:10*pi;
rho = exp(t/10);
polarplot(t,rho);

%%
%The butterfly curve
clearvars
close all
clc

t = 0:0.01:10*pi;
r = exp(sin(t))- 2*cos(4*t) + sin((2*t-pi)/24).^5;
polarplot(t,r);

%%
clearvars
close all
clc

fplot(@(x) sin(2*x)-1.1.^x * sin(x))

%%
clearvars
close all
clc

fplot(@(x) x*sin(x))
axis([-60 60 -60 60])

%%
clearvars
close all
clc 

for i = 1:0.1:50
    f = morlet(-50,i,1000);
    plot(fftshift(ifft(f)))
    hold off
    pause(0.1)
end

