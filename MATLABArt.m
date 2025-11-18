% MATLAB logo
clearvars
close all
clc

L = 160*membrane(1,100);

f = figure;
ax = axes;

s = surface(L);
s.EdgeColor = 'none';
view(3)

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 .9];

l1 = light;
l1.Position = [160 400 80];
l1.Style = 'local';
l1.Color = [0 0.8 0.8];
 
l2 = light;
l2.Position = [.5 -1 .4];
l2.Color = [0.8 0.8 0];

s.FaceColor = [0.9 0.2 0.2];

s.FaceLighting = 'gouraud';
s.AmbientStrength = 0.3;
s.DiffuseStrength = 0.6; 
s.BackFaceLighting = 'lit';

s.SpecularStrength = 1;
s.SpecularColorReflectance = 1;
s.SpecularExponent = 7;

axis off
f.Color = 'black';

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x^2 + y^2) - cos(x*y))
grid on

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x*y) + cos(x*y)-1)
grid on

%%
clearvars
close all
clc

f = fimplicit(@(x,y) 2^(sin(x)+cos(y)) - 0^sin(x));
grid on

for i = 0.1:0.1:8
    f.Function = @(x,y) 2^(sin(x)+cos(y)) - i^sin(x); 
    pause(0.01)
end

%%
clearvars
close all
clc

fimplicit(@(x,y) 1/cos(x*y) + cos(x^2+y^2)-1)
grid on

%%
clearvars
close all
clc

f = fimplicit(@(x,y) x^2 - (5*x*y) + y^2 - 1);
grid on
axis([-6 6 -4 4])

for i = -5:0.1:5
    f.Function = @(x,y) x^2 - (i*x*y) + y^2 - 1; 
    pause(0.1)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) (x^2 + y^2)^2 + 9*(x^2-2*y^2));
grid on
axis([-6 6 -4 4])

for i = 9:-0.1:-9
    f.Function = @(x,y) (x^2 + y^2)^2 + i*(x^2-2*y^2); 
    pause(0.1)
end

%%
clearvars
close all
clc

fimplicit(@(x,y) (x^2 + y^2 -11)^2 - 2*y*sin(x^2-2*sin(x)));
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) 2*cos(x^2 + y^2)-1);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) 2^(sin(x)+cos(y))-sin(2));
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) (y^2)/2 + cos(x + y^2)-1, [-20 20 -5 5]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y^2 - (x^2)*((sin(x)+y)/(sin(y)+x)), [-20 20 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x^2)-sin(y^2));
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y- x*tan(y)*cot(x), [-20 20 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y - x*sin(x^2+y^2), [-20 20 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) tan(x^2)*tan(y^2)-cot(x*y), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y*sin(y)-x*sin(x), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) 2^(sin(x)+cos(y))-exp(sin(x*y)), [-10 10 -5 5]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y - x*sin(sin(x)/sin(y)), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) y*sin(x^2)-x*sin(y^2), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x^2 + y^2) - tan(sin(x+y)), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) tan(x^2 * sin(y^2)) - tan(y^2 * sin(x^2)), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) tan(x^2 + y^2) * cos(x + y) - cos(x^2 + y^2), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) tan(x* sin(x)) - tan(y*sin(y)), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) tan(cos(x^2) + cos(y^2)) - sin(x*y), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

fimplicit(@(x,y) cos(cos(x^2) + y^2) - sin(sin(y^2)+x^2), [-10 10 -10 10]);
grid on
axis equal

%%
clearvars
close all
clc

f = fimplicit(@(x,y) sin(2*y) - 2*sin(x) - y + 3*y);
grid on
axis([-12 12 -5 5])

for i = 3:-0.1:-1
    f.Function = @(x,y) sin(2*y) - 2*sin(x) - y + i*y; 
    pause(0.1)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) (x + 5)^2 *(x^2 + y^2) - ((-5)^2)*x^2);
grid on
axis([-12 12 -5 5])

for i = [5:-0.1:-5,-5:0.1:5]
    f.Function = @(x,y) (x + i)^2 *(x^2 + y^2) - ((-i)^2)*x^2; 
    pause(0.1)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) x^2 + y^2 - 90*cos(4*x));
grid on
axis([-12 12 -5 5])

for i = -90:90
    f.Function = @(x,y) x^2 + y^2 - i*cos(4*x); 
    pause(0.001)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) y^4 - x^4 + 9*y^2 + 9*x^2);
grid on
axis([-12 12 -5 5])

for i = 9:-0.1:-9
    f.Function = @(x,y) y^4 - x^4 + i*y^2 + i*x^2; 
    pause(0.01)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) 2^3 - sin(2) -x*y);
grid on
axis([-12 12 -5 5])

for i = 2:-0.1:-2
    f.Function = @(x,y) i^3 - sin(i) -x*y; 
    pause(0.01)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) (cos(-5)*x)^2 + (cos(-5)*y)^2 - (-5)^2);
grid on
axis([-8 8 -4 4])

for i = -5:0.1:5
    f.Function = @(x,y) (cos(i)*x)^2 + (cos(i)*y)^2 - (i)^2; 
    pause(0.01)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) sin(x) + sin(y) - cos(-9));
grid on
axis([-20 20 -10 10])

for i = -9:0.1:9
    f.Function = @(x,y) sin(x) + sin(y) - cos(i); 
    pause(0.01)
end

%%
clearvars
close all
clc

f = fimplicit(@(x,y) y - 2*cos(sin(x)*0+0*y));
grid on
axis([-6 6 -4 4])

for i = 0:0.1:5
    f.Function = @(x,y) y - 2*cos(sin(x)*i+i*y); 
    pause(0.1)
end

%%
clearvars
close all
clc

fimplicit(@(x,y) (x^2 + y^2)^2 + 18*(x^2 + y^2) - 27 - 8*(x^3 - 3*x*y^2));
grid on
axis([-6 6 -4 4])

%%
clearvars
close all
clc

fimplicit(@(x,y) x^3 + y^3 - 5*x*y);
grid on
axis([-6 6 -4 4])

%%
clearvars
close all
clc

fimplicit(@(x,y) (y^2)/2 +sin(x)-1);
grid on
axis([-20 20 -12 12])

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x^2) + sin(y^2) - 0.8);
grid on
axis([-20 20 -12 12])

%%
clearvars
close all
clc

fimplicit(@(x,y) abs(sin(x^2)) + abs(sin(y^2)) - 0.8);
grid on
axis([-10 10 -4 4])

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(sin(x) +cos(y)) - cos(sin(x*y) + cos(x)));
grid on
axis([-18 18 -10 10])

%%
clearvars
close all
clc

fimplicit(@(x,y) x*mod(x,y) -y*mod(y,x));
grid on
axis([-6 6 -2 2])

%%
clearvars
close all
clc

fimplicit(@(x,y) sin(x^2 + y^2)*cos(x) - sin(y));
grid on
axis([-10 10 -5 5])

%%
clearvars
close all
clc

fimplicit(@(x,y) mod(sin(x),cos(x)) - sin(y));
grid on
axis([-14 14 -8 8])

%%
clearvars
close all
clc

fimplicit(@(x,y) cos(x*y)/sin(cos(x)) -sin(x*atan(x^2 +y^2)));
grid on
axis([-8 8 -4 4])

%%
clearvars
close all
clc

fimplicit(@(x,y) cos(16* (atan((x-2)/y) + atan(y/(x+2)))));
grid on
axis([-8 8 -4 4])
