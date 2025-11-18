% Aurinkokunta 2D
% Solar System 2D
clearvars
close all
clc

hold on
plot(0,0,'y*', LineWidth=26)

vn = 364/225;
mn = 364/(687);
venus = plot(0,0, 'o', LineWidth=12,Color=validatecolor(uint8([255 198 73])));
maa = plot(0, 0, 'o', LineWidth=16,Color=validatecolor(uint8([40 122 184])));
mars = plot(0, 0, 'o', LineWidth=18,Color=validatecolor(uint8([226 123 88])));

title('Aurinkokunta')
legend({'Aurinko','Venus','Maa','Mars'})
i = 0;
while 1
    venus.XData = cos(vn*i + pi/2)*1.2;
    venus.YData = sin(vn*i + pi/2)*1.2;
    
    maa.XData = cos(i)*1.5;
    maa.YData = sin(i)*1.5;

    mars.XData = cos(i*mn)*1.8;
    mars.YData = sin(i*mn)*1.8;
    axis([-2 2 -2 2])
    pause(0.01)
    i = 0.01 + i;
end

%%
% Aurinkokunta 3D
% Solar System 3D

clearvars
close all
clc

[X Y Z]=sphere;

t=linspace(0,2*pi,1000);
x=cos(t);
y=sin(t);
i = 0;

vn = 364/225;
mn = 364/(687);

hold on
surf(X,Y,Z, 'LineStyle','none',FaceColor=validatecolor('#FED33C'))
venus = plot(0,0, 'o', LineWidth=12,Color=validatecolor(uint8([255 198 73])));
maa = plot(0, 0, 'o', LineWidth=16,Color=validatecolor(uint8([40 122 184])));
mars = plot(0, 0, 'o', LineWidth=18,Color=validatecolor(uint8([226 123 88])));
axis([-2 2 -2 2 -1 1])
title('Aurinkokunta')
legend({'Aurinko','Venus','Maa','Mars'})

while 1
    venus.XData = cos(vn*i + pi/2)*1.2;
    venus.YData = sin(vn*i + pi/2)*1.2;
    
    maa.XData = cos(i)*1.5;
    maa.YData = sin(i)*1.5;

    mars.XData = cos(i*mn)*1.8;
    mars.YData = sin(i*mn)*1.8;
    view(3)
    pause(0.01)
    i = i+0.01;
end
%%
% Paljon merkkejä tehty randomilla
% Siisti todennäköisyys kaavio

clearvars
close all
clc

hold on
view(3)
for i = 1:1001
    r1 = 5*rand(1)*rand(1);
    r2 = 5*rand(1)*rand(1);
    r3 = 5*rand(1)*rand(1);
    R(i,1) = r1;
    R(i,2) = r2;
    R(i,3) = r3;
    p = plot3(r1,r2,r3);
    p.Color=validatecolor(uint8([randi(255) randi(255) randi(255)]));
    p.Marker='o';
end
grid on
figure
histogram(R, 'Normalization','probability')


%%
% Partikkeli juttu
clearvars
close all
clc
n=1000;
r1 = 4*rand(n,1)-2;
r2 = 4*rand(n,1)-2;
r3 = 4*rand(n,1)-2;
p = plot3(r1,r2,r3,'ro');
while 1
    r1 = 0.01*rand(n,1);
    r2 = 0.01*rand(n,1);
    r3 = 0.01*rand(n,1);
    x = p.XData';
    y = p.YData';
    z = p.ZData';
    p.XData=x+r1;
    p.YData=y+r2;
    p.ZData=z+r3;
    pause(0.1)
    x = p.XData';
    y = p.YData';
    z = p.ZData';
    p.XData=x-r1;
    p.YData=y-r2;
    p.ZData=z-r3;
    axis([-2 2 -2 2 -4 4])
end
%%
% Tee jotain siistiä latex koodilla tai text funktiolla
clearvars
close all
clc

str = '\bf \it Hello world!';
txt = text(0.5,0.5,str,'Interpreter','latex');
aika = datetime("now");
sekunti = aika.Second;
r_txt = num2str(sekunti);
txt2.String = ['\bf ', r_txt];
txt2 = text(0.5,0.2,txt2.String);
%%
% Aalto-animaatio
% Wave animation
clearvars
close all
clc

[X,Y]=meshgrid(-3:0.1:3,-2:0.1:2);
n = 0;
while 1
    Z=sin(Y + 4*n) + cos(X + 4*n);
    % Z=tan(n*Y) + tan(n*X);
    mesh(X,Y,Z);
    axis([-2 2 -2 2 -2 2])
    pause(0.01)
    n = n + 0.01;
end

%%
clearvars
close all
clc

p = fplot(@(x) 0.1*cos(0*x^x));

for i = 0.1:0.1:15
    p.Function = @(x) 0.1*cos(i*x^x);
    pause(0.1)
end

%%
clearvars
close all
clc

p = fplot(@(x) 2*sin(0*cos(x)))
axis([-2 2 -2 2])

for i = 0.1:0.1:10
    p.Function = @(x) 2*sin(i*cos(x))
    pause(0.01)
end

%%
clearvars
close all
clc

p = fplot(@(x) sin(0) + x*cos(0));
axis([-6 6 -4 4])
grid on

for i = 0.1:0.1:15
    p.Function = @(x) sin(i) + x*cos(i);
    pause(0.01)
end

%%
clearvars
close all
clc

p = fplot(@(x) sin(0)*x+sin(x)*0);
axis([-60 60 -60 60])

for i = 0:0.1:50
    p.Function = @(x) sin(i)*x+sin(x)*i;
    pause(0.01)
end

%%
clearvars
close all
clc
t = 0:0.1:8*pi;

p = polarplot(t, 3*sin(0*t));

for i = 0:0.01:1
    p.RData = 3*sin(i*t);
    pause(0.05)
end

%%
clearvars
close all
clc
t = 0:0.01:8*pi;

p = polarplot(t, sin((0/5)*t));

for i = 0:0.1:20
    p.RData = sin((i/5)*t);
    pause(0.05)
end

%%
%Tee jotain siistiä viiva animaatioilla cos tai sin funktioilla
clearvars
close all
clc

a1 = animatedline('Color',[0 .7 .7]);
a2 = animatedline('Color',[0 .5 .5]);
a3 = animatedline('Color',[0 .3 .3]);
a4 = animatedline('Color',[0 .1 .1]);

axis equal
([-1 20 -1 1]);
x = linspace(0,20,10000);
for k = 1:length(x)
    
    xk = x(k);
    eka_viiva = cos(xk.^5);
    addpoints(a1,sin(xk.^5),eka_viiva);

    %kolmas_viiva = sin(2.41.*xk^2);
    %addpoints(a1,xk,kolmas_viiva);

    %neljas_viiva = sin(1./xk);
    %addpoints(a1,xk, neljas_viiva);

    % drawnow limitrate 
    drawnow
end
%%
% Lihasjännitys
% Muscle tension

clearvars
close all
clc

n=20;
x=2;
y=2;

plot(x, y)
hold on;
for i = 1:n
    plot(sphere*(1.5+sin(i)))
    axis equal
    xlabel('lihasjännitys');
    pause(0.75)
    hold off
end

%%
clearvars
close all
clc
% Lateksii ry:n logot

hold on
x = [-0.25,0.25,0.1,-0.1,-0.25];
y = [0,0,1.15,1.15,0];
B=[x;y];

for theta = linspace(0,2*pi,10)
    R = [cos(theta), -sin(theta);sin(theta),cos(theta)];
    C = R*B;
    fill(C(1,:),C(2,:),'k')
end
t=0:0.01:2.1*pi;
fill(cos(t), sin(t), validatecolor(uint8([255 0 255])))
plot(cos(t), sin(t), LineWidth=8, Color='k')
text(0, 0, '\Xi', FontSize=200, HorizontalAlignment='center')
axis equal

%%
%pallo vaihtaa väriä kun x ei ole määritelty animaatio
%jousi animaatio?

clearvars 
close all
clc

x=0:0.01:1;
y=cos(1./x);
for i = 1:numel(x)
    j=numel(x)-i+1;
    plot(x,y)
    hold on
    plot(x(j), y(j), 'bo')
    axis equal
    pause(0.01)
    hold off
end

x=-1:0.01:0;
y=cos(1./x);
for i = 1:numel(x)
    j=numel(x)-i+1;
    plot(x,y)
    hold on
    plot(x(j), y(j), 'ro')
    axis equal
    pause(0.01)
    hold off
end

x=-1:0.01:0;
y=cos(1./x);
for i = 1:numel(x)
    j=numel(x)-i+1;
    plot(x,y)
    hold on
    plot(x(i), y(i), 'ro')
    axis equal
    pause(0.01)
    hold off
end

x=0:0.01:1;
y=cos(1./x);
for i = 1:numel(x)
    j=numel(x)-i+1;
    plot(x,y)
    hold on
    plot(x(i), y(i), 'bo')
    axis equal
    pause(0.01)
    hold off
end

X=0:0.01:1;
for i = 1:numel(X)
    Y=cos(i./X);
    plot(X, Y)
end
%%
% Sylinteri
% Cylinder

clearvars
close all
clc

r=1; 
n=100;
kulma=linspace(0,2*pi, n);
Ax = r*cos(kulma);
Ay = r*sin(kulma);
a = 2.5;
e = 0.25;
c = 0.5;
d = 1;
t = 0.06;
By = e + c/2;
Bx = Ax+ sqrt(a^2-(Ay-e-c/2).^2);
axislimits=[min(Ax)*1.1 max(Bx)*1.2 min(Ay)*1.1 max(Ay)*1.1];
sliderY=[e e+c e+c e e];
groundX=[min(Bx)-d/2 min(Bx)-d/2 max(Bx)+d/2 max(Bx)+d/2 min(Bx)-d/2];
groundY=[e-t e e e-t e-t];
videoObject=VideoWriter('sylinteri', 'MPEG-4');
videoObject.FrameRate = 15; 
open(videoObject)
for i = 1:n
    plot(Ax, Ay, '--', 0, 0, 'ko')
    axis equal
    hold on
    sliderX=[Bx(i)-d/2 Bx(i)-d/2 Bx(i)+d/2 Bx(i)+d/2 Bx(i)-d/2];
    fill(sliderX, sliderY,'m')
    fill(groundX, groundY, 'g')
    plot([0, Ax(i)], [0,Ay(i)], 'k', 'LineWidth',2)
    plot(Ax(i), Ay(i), 'ko')
    plot(Bx(i), By, 'ko')
    axis(axislimits)
    plot([Ax(i), Bx(i)],[Ay(i),By],'k', 'LineWidth',2)
    axis off
    hold off
    frames(i)=getframe;
end
for k = 1:5
    writeVideo(videoObject,frames)
end
close(videoObject)

%%
% JPEG-kuva
clearvars
close all
clc 

figure 
tiledlayout(2,8);

nexttile([2 2])
imshow('he_persisted.jpeg');

nexttile([2 2])
imshow('rukantaistelu.jpg')

nexttile([2 2])
imshow('kakku.jpg')

nexttile([2 2])
imshow('aamuja.png')
