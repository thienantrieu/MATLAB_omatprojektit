%IP-osoitteen sijainti
%Location of IP-address
clearvars
close all
clc
url = 'https://ipinfo.io/json';
data = webread(url)


ip = data.ip;
city = data.city;
region = data.region;
country = data.country;
posti = data.postal;
loc = data.loc;
loc = split(loc,',');
s = str2double(loc);

fprintf('IP-osoite: %s\n', ip);
fprintf('Kaupunki: %s\n', city);
fprintf('Alue: %s\n', region);
fprintf('Maa: %s\n', country);
fprintf('Postiosoite: %s\n', posti);
fprintf('Sijainti (Lat, Long): %f %f\n', s(1), s(2));

l = 0.1;

geoscatter(s(1),s(2))
geolimits([s(1)-l s(1)+l],[s(2)-l s(2)+l])
geobasemap satellite

%%
% Geoguessr
clearvars
close all
clc

r1 = 150*rand()-60
r2 = 360*rand()
l = 0.1;

geoscatter(r1,r2)
geolimits([r1-l, r1+l], [r2-l, r2-l])
geobasemap satellite

