%Conwayn peli
%Conway's Game of Life
clearvars
close all 
clc

pelin_koko = 100;
nykyinen_elama = round(rand(pelin_koko, pelin_koko));

plottoolfunc(1, 'Elämä', 12);
while 1
    axis equal
    %cla;
    spy(nykyinen_elama)
    grid on
    uusi_elama = nykyinen_elama;
    for i = 1:pelin_koko
        si = i-1;
        ei = i+1;
        veci = si:ei;
        veci(veci==0) = pelin_koko;
        veci(veci==pelin_koko+1)=1;
        for j = 1:pelin_koko
            sj = j-1;
            ej = j+1;
            vecj = sj:ej;
            vecj(vecj==0) = pelin_koko;
            vecj(vecj==pelin_koko+1)=1;
            naapurit = sum(sum(nykyinen_elama(veci, vecj)))-nykyinen_elama(i,j);
            if nykyinen_elama(i, j)
                if naapurit < 2  %liian vähän porukkaa
                    uusi_elama(i, j) = 0;
                end
                if naapurit > 3  %ylikansoitus
                    uusi_elama(i, j) = 0;
                end
            else
                if naapurit == 3
                    uusi_elama(i,j)=1;
                end
            end
        end
    end
    drawnow
    pause(0.05)
    nykyinen_elama = uusi_elama;
end

%%
%Conwayn peli
%Conway's Game of Life
%Animaatio 1
%Ötökkä/Kiituri
%Glider

clearvars
close all 
clc

pelin_koko = 10;
nykyinen_elama = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                  0, 0, 0, 0, 0, 0, 1, 1, 0, 0;
                  0, 0, 0, 0, 0, 0, 1, 0, 1, 0;
                  0, 0, 0, 0, 0, 0, 1, 0, 0, 0];

plottoolfunc(1, 'Elämä', 12);
while 1
    axis ([-pelin_koko pelin_koko -pelin_koko pelin_koko])
    spy(nykyinen_elama)
    uusi_elama = nykyinen_elama;
    for i = 1:pelin_koko
        si = i-1;
        ei = i+1;
        veci = si:ei;
        veci(veci==0) = pelin_koko;
        veci(veci==pelin_koko+1)=1;
        for j = 1:pelin_koko
            sj = j-1;
            ej = j+1;
            vecj = sj:ej;
            vecj(vecj==0) = pelin_koko;
            vecj(vecj==pelin_koko+1)=1;
            naapurit = sum(sum(nykyinen_elama(veci, vecj)))-nykyinen_elama(i,j);
            if nykyinen_elama(i, j)
                if naapurit < 2  %liian vähän porukkaa
                    uusi_elama(i, j) = 0;
                end
                if naapurit > 3  %ylikansoitus
                    uusi_elama(i, j) = 0;
                end
            else
                if naapurit == 3
                    uusi_elama(i,j)=1;
                end
            end
        end
    end
    drawnow
    pause(0.05)
    nykyinen_elama=uusi_elama;
end


%%
%Conwayn peli
%Conway's Game of Life
%Animaatio 2
%Bucky/joku hassu muu

clearvars
close all 
clc

% pelin_koko = 100;
A = [-15:15 0 -15:15 0 -15:15 0 -15:15];
E = expm(diag(A,-1))*expm(diag(A,1));
M = mod(round(abs(E)),2);
F = M +fliplr(M);

nykyinen_elama = F;
pelin_koko = size(nykyinen_elama,1)

plottoolfunc(1, 'Elämä', 12);
while 1
    axis ([-pelin_koko pelin_koko -pelin_koko pelin_koko])
    cla;
    spy(nykyinen_elama)
    grid on
    uusi_elama = nykyinen_elama;
    for i = 1:pelin_koko
        si = i-1;
        ei = i+1;
        veci = si:ei;
        veci(veci==0) = pelin_koko;
        veci(veci==pelin_koko+1)=1;
        for j = 1:pelin_koko
            sj = j-1;
            ej = j+1;
            vecj = sj:ej;
            vecj(vecj==0) = pelin_koko;
            vecj(vecj==pelin_koko+1)=1;
            naapurit = sum(sum(nykyinen_elama(veci, vecj)))-nykyinen_elama(i,j);
            if nykyinen_elama(i, j)
                if naapurit < 2  %liian vähän porukkaa
                    uusi_elama(i, j) = 0;
                end
                if naapurit > 3  %ylikansoitus
                    uusi_elama(i, j) = 0;
                end
            else
                if naapurit == 3
                    uusi_elama(i,j)=1;
                end
            end
        end
    end
    drawnow
    pause(0.05)
    nykyinen_elama=uusi_elama;
end


