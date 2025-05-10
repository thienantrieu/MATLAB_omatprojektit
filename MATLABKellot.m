%%
%Kuunvaiheet 
clearvars
close all
clc

url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Lappeenranta?key=SMHZJVM7LAWP95ENVRJY2YKFJ';

weather = webread(url);
n = weather.currentConditions.moonphase;
t = linspace(0,2*pi,1000);
kuu =@(i) [cos(i)-1.5;sin(i)];
R = @(j) [cos(j), -sin(j); sin(j), cos(j)];

vaihe=R(-n*pi)*kuu(t);
hold on

fill(4*cos(t/2),4*sin(t/2),'k')
fill(vaihe(1,:),vaihe(2,:),'w', LineStyle='none');
fill(1.5*cos(t/2)-2,1.5*sin(t/2),'k')
fill(1.5*cos(t/2)+2,1.5*sin(t/2),'k')
r1 = -4+rand(50,1)*8;
r2 = rand(50,1)*4;
plot(r1,r2,'w*')

plot(cos(t)*6,sin(t)*6,'k')
plot(cos(t)*2,-2.25+sin(t)*2,'k')

marker = {'I'; 'II'; 'III';'IV'; 'V';'VI'; 'VII';'VIII'; 'IX'; 'X';'XI'; 'XII'};

for i = 1:12
    text(sin(i*pi/6)*5.5, cos(i*pi/6)*5.5, marker(i), 'Interpreter','latex','FontAngle','italic','HorizontalAlignment','center', FontSize=25);
    text(sin(i*pi/6)*1.8, -2.25+cos(i*pi/6)*1.8, string(i),HorizontalAlignment="center")
end

t_viisari = quiver(0, 0, 0, 0, Color='b', LineWidth=3);
m_viisari = quiver(0, 0, 0, 0, Color='b',LineWidth=2);
s_viisari = quiver(0, 0, 0, 0, Color='b',ShowArrowHead='off');
k_viisari = quiver(0, -2.25, 0, 0, Color='k',ShowArrowHead='off');
axis equal

while 1
    T = datetime('now');
    paiva = T.Day;
    kuukausi = T.Month;
    tunti = T.Hour;
    minuutti = T.Minute;
    sekunti = T.Second;

    if kuukausi == 1 && kuukausi == 3 && kuukausi == 5 && kuukausi== 7 && kuukausi == 8 && kuukausi == 10 && kuukausi == 12
        maxpaiva = 31;
    elseif kuukausi == 2
        maxpaiva = 28;
    else
        maxpaiva = 30;
    end

    mo = kuukausi*30 + 360*paiva/(maxpaiva*60);
    h = tunti*30 + minuutti/2;
    m = minuutti*6 + sekunti/10;
    s = sekunti*6;
    

    k_viisari.UData = -cosd(90+mo)*1.5; 
    k_viisari.VData = sind(90+mo)*1.5;
    t_viisari.UData = -cosd(90+h)*2; 
    t_viisari.VData = sind(90+h)*2;
    m_viisari.UData = -cosd(90+m)*4;
    m_viisari.VData = sind(90+m)*4;
    s_viisari.UData = -cosd(90+s)*5.5; 
    s_viisari.VData = sind(90+s)*5.5;
    pause(0.001)
end

%%
%Omega Seamaster Diver 300m
clearvars
close all
clc

t = linspace(0,2*pi,1000);

hold on
plot(cos(t), sin(t), 'k',LineWidth=5)
fill(cos(t), sin(t), validatecolor(uint8([5 4 170])))
plot(0, 0, 'ko', LineWidth=5)
text(0,-0.1,'ZrO2','HorizontalAlignment','center')
for i=0:0.1:0.9
    fplot(@(x) sin(10*x)/60 + i,[-1+i 1-i], 'k', LineWidth=2)
    fplot(@(x) sin(10*x)/60 - i,[-1+i 1-i], 'k', LineWidth=2)
end
text(0,-0.1,'$$ZrO_2$$',Interpreter='latex',Color='k',FontSize=12,EdgeColor='k',BackgroundColor=validatecolor(uint8([5 4 170])),HorizontalAlignment='center')
text(0, 0.7, '\Omega', 'FontSize',30, Color='w', HorizontalAlignment='center')
text(0, 0.6, 'OMEGA', 'FontSize',15, Color='w', HorizontalAlignment='center')
text(0, 0.25, 'Seamaster', 'FontSize',11, Color='r', FontAngle='italic', HorizontalAlignment='center')
text(0, 0.15, 'Professional', 'FontSize',12, Color='w', HorizontalAlignment='center')
text(0, -0.4, 'CO-AXIAL', 'FontSize',10, Color='w', HorizontalAlignment='center')
text(0, -0.5, 'MASTER CHRONOMETER', 'FontSize',10, Color='w', HorizontalAlignment='center')
text(0, -0.6, '300m / 1000ft', 'FontSize',10, Color='w', HorizontalAlignment='center')
title('Omega Seamaster Diver 300m')
kronografi = text(-0.025, -0.8, "",BackgroundColor='w', FontSize=12);

for i = 0:30:330
    if i == 0
        plot([0.88:0.01:0.98], 0, 'w_', LineWidth=10)
    elseif i == 180
        plot([-0.98:0.01:-0.88], 0, 'w_', LineWidth=10)
    elseif i == 90
        plot(-0.032, [0.8:0.01:0.92], 'w|', LineWidth=12)
        plot(0.032, [0.8:0.01:0.92], 'w|', LineWidth=12)
    elseif i == 270
        plot(0, [-0.95:0.01:-0.92], 'w|', LineWidth=10)
    else
        plot(cosd(i)*0.9, sind(i)*0.9, 'wo', LineWidth=12)
    end
end
t_viisari = quiver(0, 0, 0, 0, Color='w', LineWidth=8);
m_viisari = quiver(0, 0, 0, 0, Color='w', LineWidth=5);
s_viisari = quiver(0, 0, 0, 0, Color='r');
s_viisari.ShowArrowHead = "off";
axis equal

while 1
    T = datetime('now');
    paiva = T.Day;
    tunti = T.Hour;
    minuutti = T.Minute;
    sekunti = T.Second;
    h = tunti*30 + minuutti/2;
    m = minuutti*6 + sekunti/10;
    s = sekunti*6;
    
    kronografi.String = num2str(paiva);
    t_viisari.UData = -cosd(90+h)*0.6; 
    t_viisari.VData = sind(90+h)*0.6;
    m_viisari.UData = -cosd(90+m)*0.8;
    m_viisari.VData = sind(90+m)*0.8;
    s_viisari.UData = -cosd(90+s); 
    s_viisari.VData = sind(90+s);
    pause(0.001)
end

%%
%Omega Speedmaster Moonwatch
clearvars
close all
clc

t = linspace(0,2*pi,1000);

hold on
plot(cos(t), sin(t), 'k',LineWidth=5)
fill(cos(t), sin(t), 'k')
fill(cos(t)*0.03,sin(t)*0.03, 'w')
fill(cos(t)*0.02+0.45,sin(t)*0.02, 'w')
fill(cos(t)*0.02-0.45,sin(t)*0.02, 'w')
fill(cos(t)*0.02,sin(t)*0.02-0.45, 'w')
fill(cos(t)*0.015+0.05,sin(t)*0.015+0.82, 'w')
fill(cos(t)*0.015-0.05,sin(t)*0.015+0.82, 'w')
%fill((cos(t)+1.65)*0.3, sin(t)*0.3, 'k')
%fill((cos(t)-1.65)*0.3, sin(t)*0.3, 'k')
%fill(cos(t)*0.3, (sin(t)-1.65)*0.3, 'k')
text(0, 0.7, '\Omega', 'FontSize',30, Color='w', HorizontalAlignment='center')
text(0, 0.6, 'OMEGA', 'FontSize',15, Color='w', HorizontalAlignment='center')
text(0, 0.45, 'Speedmaster', 'FontSize',11, Color='w', FontAngle='italic', HorizontalAlignment='center')
text(0, 0.35, 'Professional', 'FontSize',12, Color='w', HorizontalAlignment='center')
text(-0.45, 0.18, '60', Color='w', HorizontalAlignment='center')
text(-0.58, -0.072, '40', Color='w', HorizontalAlignment='center')
text(-0.3, -0.072, '20', Color='w', HorizontalAlignment='center')

text(0, -0.3, '12', Color='w', HorizontalAlignment='center')
text(-0.19, -0.45, '9', Color='w', HorizontalAlignment='center')
text(0, -0.6, '6', Color='w', HorizontalAlignment='center')
text(0.19, -0.45, '3', Color='w', HorizontalAlignment='center')

text(0.45, 0.18, '30', Color='w', HorizontalAlignment='center')
text(0.3, -0.072, '20', Color='w', HorizontalAlignment='center')
text(0.58, -0.072, '10', Color='w', HorizontalAlignment='center')
title('Omega Speedmaster Moonwatch')
axis equal square

t_viisari = quiver(0, 0, 0, 0, Color='w', LineWidth=8);
m_viisari = quiver(0, 0, 0, 0, Color='w', LineWidth=5);
s_viisari = quiver(-0.45, 0, 0, 0, Color='w', ShowArrowHead='off');
as_viisari = quiver(0.45 ,0, 0, 0.33, Color='w', ShowArrowHead='off');
am_viisari = quiver(0, -0.45, 0, 0.3, Color='w', ShowArrowHead='off');


for i = linspace(0,2*pi,61)
    O1 = quiver(cos(i), sin(i), -cos(i)*0.1, -sin(i)*0.1);
    O1.ShowArrowHead="off";
    O1.Color='w';
end

for i = linspace(0,2*pi,301)
    O3 = quiver(cos(i), sin(i), -cos(i)*0.05, -sin(i)*0.05);
    O3.ShowArrowHead="off";
    O3.Color='w';
end

for i = linspace(0,2*pi,31)
    o1 = quiver((cos(i)+1.5)*0.3, sin(i)*0.3, -cos(i)*0.1, -sin(i)*0.1);
    o1.ShowArrowHead="off";
    o1.Color='w';
end

for i = linspace(0,2*pi,13)
    o2 = quiver((cos(i)-1.5)*0.3, sin(i)*0.3, -cos(i)*0.1, -sin(i)*0.1);
    o3 = quiver(cos(i)*0.3, (sin(i)-1.5)*0.3, -cos(i)*0.1, -sin(i)*0.1);
    O2 = quiver(cos(i)*0.98, sin(i)*0.98, -cos(i)*0.2, -sin(i)*0.2);
    O2.LineWidth=4;
    O2.ShowArrowHead="off";
    O2.Color='w';
    o2.ShowArrowHead="off";
    o2.Color='w';
    o3.ShowArrowHead="off";
    o3.Color='w';
end
as = 0;
am = 0;

while 1
    T = datetime('now');
    paiva = T.Day;
    tunti = T.Hour;
    minuutti = T.Minute;
    sekunti = T.Second;
    h = tunti*30 + minuutti/2;
    m = minuutti*6 + sekunti/10;
    s = sekunti*6;
    % as = (sekunti-sekunti+0.001)*6;
    

    kronografi.String = num2str(paiva);
    t_viisari.UData = -cosd(90+h)*0.6; 
    t_viisari.VData = sind(90+h)*0.6;
    m_viisari.UData = -cosd(90+m)*0.8;
    m_viisari.VData = sind(90+m)*0.8;
    s_viisari.UData = -cosd(90+s)*0.33; 
    s_viisari.VData = sind(90+s)*0.33;

    % as_viisari.UData = -cosd(90+as)*0.33; 
    % as_viisari.VData = sind(90+as)*0.33;

    pause(0.001)
end

%%
%latex kello 
clearvars
close all
clc

t = linspace(0,2*pi,1000);

hold on
plot(cos(t), sin(t), 'k',LineWidth=5)
fill(cos(t), sin(t), validatecolor(uint8([255 0 255])))
axis equal

t_viisari = quiver(0, 0, 0, 0, Color='k', LineWidth=8);
m_viisari = quiver(0, 0, 0, 0, Color='k', LineWidth=5);
s_viisari = quiver(0, 0, 0, 0, Color='k');

plot(0,0, 'y.', LineWidth=10)

marker = {'$ e^0 $'; 
    '$ \sqrt{4} $';
    '$ \frac{d}{dt}3x $';
    '$ 2^2 $';
    '$ 10-5 $';
    '$ 6x-4 = 32 $';
    '$ \sqrt{49} $';
    '$ \frac{16}{2} $';
    '$ 3^2 $';
    '$ 4+3 \times 2 $';
    '$ \sqrt{121} $';
    '$ 2 \times 3!  $'};

for i = 1:12
    text(sin(i*pi/6)*0.8, cos(i*pi/6)*0.8, marker(i), 'Interpreter','latex', 'HorizontalAlignment','center', FontSize=25);
end

while 1
    T = datetime('now');
    paiva = T.Day;
    tunti = T.Hour;
    minuutti = T.Minute;
    sekunti = T.Second;
    h = tunti*30 + minuutti/2;
    m = minuutti*6 + sekunti/10;
    s = sekunti*6;
    
    kronografi.String = num2str(paiva);
    t_viisari.UData = -cosd(90+h)*0.6; 
    t_viisari.VData = sind(90+h)*0.6;
    m_viisari.UData = -cosd(90+m)*0.8;
    m_viisari.VData = sind(90+m)*0.8;
    s_viisari.UData = -cosd(90+s)*0.3; 
    s_viisari.VData = sind(90+s)*0.3;
    pause(0.001)
end

%%
%Digitaalinen kello-animaatio

clearvars
close all
clc

t = linspace(0,2*pi,1000);

hold on
fill(cos(t)*1.25, sin(t)*1.25, 'k')
%fill([-1 1 1 -1], [-1 -1  1 1], 'k')
tunti = text(-0.5, 0, "", BackgroundColor='r', FontSize=20, HorizontalAlignment='center');
minuutti = text(0, 0, "", BackgroundColor='r', FontSize=20, HorizontalAlignment='center');
sekunti = text(0.5, 0, "", BackgroundColor='r', FontSize=20, HorizontalAlignment='center');
paiva = text(0, -0.5, "", BackgroundColor='r', FontSize=20, HorizontalAlignment='center');
aikavyovyke = text(0, 0.5, "", BackgroundColor='r', FontSize=20, HorizontalAlignment='center');
axis equal

while 1
    T = datetime('now');
    h = T.Hour;
    m = T.Minute;
    s = T.Second;
    d = T.Day;
    tz = T.SystemTimeZone;

    tunti.String = num2str(h);
    minuutti.String = num2str(m);
    sekunti.String = num2str(s);
    paiva.String = num2str(d);
    aikavyovyke.String = tz;
    pause(0.00000001)
end

%%
%Digi-analoginen kello

clearvars
close all
clc

%Sekunnit
s1 = text(0, 0, '', HorizontalAlignment='center');
s2 = text(0, 0, '', HorizontalAlignment='center');
s3 = text(0, 0, '', HorizontalAlignment='center');
s4 = text(0, 0, '', HorizontalAlignment='center');
s5 = text(0, 0, '', HorizontalAlignment='center');

%Minuutit
m1 = text(0, 0, '', HorizontalAlignment='center');
m2 = text(0, 0, '', HorizontalAlignment='center');
m3 = text(0, 0, '', HorizontalAlignment='center');
m4 = text(0, 0, '', HorizontalAlignment='center');
m5 = text(0, 0, '', HorizontalAlignment='center');

%Tunnit
t1 = text(0, 0, '','Interpreter', 'latex', HorizontalAlignment='center');
t2 = text(0, 0, '', 'Interpreter', 'latex', HorizontalAlignment='center');
t3 = text(0, 0, '', 'Interpreter', 'latex' ,HorizontalAlignment='center');

while 1
    T = datetime('now');
    paiva = T.Day;
    tunti = T.Hour;
    minuutti = T.Minute;
    sekunti = T.Second;
    h = tunti*30 + minuutti/2;
    m = minuutti*6 + sekunti/10;
    s = sekunti*6;

    s1.Position = [-cosd(90+s)*0.15 sind(s+90)*0.15];
    s1.String = num2str(sekunti);
    s2.Position = [-cosd(90+s)*0.4 sind(s+90)*0.4];
    s2.String = num2str(sekunti);
    s3.Position = [-cosd(90+s)*0.7 sind(s+90)*0.7];
    s3.String = num2str(sekunti);
    s4.Position = [-cosd(90+s)*0.9 sind(s+90)*0.9];
    s4.String = num2str(sekunti);
    s5.Position = [-cosd(90+s)*1.1 sind(s+90)*1.1];
    s5.String = num2str(sekunti);

    m1.Position = [-cosd(90+m)*0.05 sind(m+90)*0.05];
    m1.String = num2str(minuutti);
    m2.Position = [-cosd(90+m)*0.3 sind(m+90)*0.3];
    m2.String = num2str(minuutti);
    m3.Position = [-cosd(90+m)*0.6 sind(m+90)*0.6];
    m3.String = num2str(minuutti);
    m4.Position = [-cosd(90+m)*0.8 sind(m+90)*0.8];
    m4.String = num2str(minuutti);
    m5.Position = [-cosd(90+m) sind(m+90)];
    m5.String = num2str(minuutti);

    t1.String = ['\bf', num2str(tunti)];
    t2.Position = [-cosd(90+h)*0.25 sind(h+90)*0.25];
    t2.String = ['\bf', num2str(tunti)];
    t3.Position = [-cosd(90+h)*0.5 sind(h+90)*0.5];
    t3.String = ['\bf', num2str(tunti)];

    pause(0.0001)
    axis([-1.2 1.2 -1.2 1.2])
    grid on
end
