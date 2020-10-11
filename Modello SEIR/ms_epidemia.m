
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Simula la diffusione di un'epidemia                                 %%%
%%% in assenza (ic=0) e in presenza (ic=1) di vaccinazione              %%%
%%% Variabili: S=suscettibili, E=infettati, I=infettivi, R=immuni,      %%%
%%% N=popolazione totale, V=vaccinazione, Nr=traiettoria di riferimento %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% G. e L. Celentano - Modificato da Antonio Romano

%clc, close all, clear all

global mun gamn sign wn nin betn a ic
global mu gam sig w ni bet 

%%% Parametri nominali %%%
mun=1/255;
gamn=1/1.2;
sign=gamn;
wn=1/12;
nin=1/115;
%nin=mun;
betn=1.66;

%%% Parametri della legge di controllo %%%
eps=1/3;
a=.1;

%ATTENZIONE, bisogna caricare i dati dal file dpc-covid19-ita-regioni-20200309.xls seguendo i passaggi del pdf allegato

%LOMBARDIA
%In R0 viene sommato circa 200 che indica il numero dei deceduti che sono morte non per il virus nel mese di marzo 
for i=1:5

%%% Condizioni iniziali %%%
%N0=1000;x0=rand(4,1);x0=x0*N0/sum(x0);R0=x0(4);
S0=LomPopolazione - LomRicSintomi - LomTotOsped - LomGuariti - LomIsolamento - LomDeceduti - 200;
E0=LomRicSintomi;
I0=LomTotOsped;
R0=LomGuariti + LomIsolamento + LomDeceduti + 200;
x0=[S0 E0 I0 R0]';N0=sum(x0);

%%% Incertezze dei parametri %%%
%dd=ones(6,1);
dd=rand(6,1)/2.5-.2+1;
%dd=rand(6,1)/5-.1+1;
dmu=dd(1);dgam=dd(2);dsig=dd(3);dw=dd(4);dni=dd(5);dbet=dd(6);
mu=dmu*mun;gam=dgam*gamn;sig=dsig*sign;w=dw*wn;ni=dni*nin;bet=dbet*betn;

ic=0; %%% Nessuna vaccinazione

sim('epidemia')

figure(1)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Lombardia - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(2)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[days]'),legend('Vaccinazione')
title(['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%'])
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

ic=1; %%% Con vaccinazione

sim('epidemia')

figure(3)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Lombardia - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(4)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[giorni]'),legend('Vaccinazione')
title({'Lombardia - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 -Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

end

%EMILIA ROMAGNA
for i=1:5

%%% Condizioni iniziali %%%
%N0=1000;x0=rand(4,1);x0=x0*N0/sum(x0);R0=x0(4);
S0=EmiPopolazione - EmiRicSintomi - EmiTotOsped - EmiGuariti - EmiIsolamento - EmiDeceduti - 200;
E0=EmiRicSintomi;
I0=EmiTotOsped;
R0=EmiGuariti + EmiIsolamento + EmiDeceduti + 200;
x0=[S0 E0 I0 R0]';N0=sum(x0);

%%% Incertezze dei parametri %%%
%dd=ones(6,1);
dd=rand(6,1)/2.5-.2+1;
%dd=rand(6,1)/5-.1+1;
dmu=dd(1);dgam=dd(2);dsig=dd(3);dw=dd(4);dni=dd(5);dbet=dd(6);
mu=dmu*mun;gam=dgam*gamn;sig=dsig*sign;w=dw*wn;ni=dni*nin;bet=dbet*betn;

ic=0; %%% Nessuna vaccinazione

sim('epidemia')

figure(1)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Emilia Romagna - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(2)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[days]'),legend('Vaccinazione')
title({'Emilia Romagna - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

ic=1; %%% Con vaccinazione

sim('epidemia')

figure(3)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Emilia Romagna - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause
figure(4)

subplot(2,1,1)
plot(t,V),grid,xlabel('t[giorni]'),legend('Vaccinazione')
title({'Emilia Romagna - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 -Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

end

%VENETO
for i=1:5

%%% Condizioni iniziali %%%
%N0=1000;x0=rand(4,1);x0=x0*N0/sum(x0);R0=x0(4);
S0=VenPopolazione - VenRicSintomi - VenTotOsped - VenGuariti - VenIsolamento - VenDeceduti - 200;
E0=VenRicSintomi;
I0=VenTotOsped;
R0=VenGuariti + VenIsolamento + VenDeceduti + 200;
x0=[S0 E0 I0 R0]';N0=sum(x0);

%%% Incertezze dei parametri %%%
%dd=ones(6,1);
dd=rand(6,1)/2.5-.2+1;
%dd=rand(6,1)/5-.1+1;
dmu=dd(1);dgam=dd(2);dsig=dd(3);dw=dd(4);dni=dd(5);dbet=dd(6);
mu=dmu*mun;gam=dgam*gamn;sig=dsig*sign;w=dw*wn;ni=dni*nin;bet=dbet*betn;

ic=0; %%% Nessuna vaccinazione

sim('epidemia')

figure(1)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Veneto - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(2)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[days]'),legend('Vaccinazione')
title({'Veneto - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

ic=1; %%% Con vaccinazione

sim('epidemia')

figure(3)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Veneto - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(4)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[giorni]'),legend('Vaccinazione')
title({'Veneto - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 -Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

end

%PIEMONTE
for i=1:5

%%% Condizioni iniziali %%%
%N0=1000;x0=rand(4,1);x0=x0*N0/sum(x0);R0=x0(4);
S0=PiePopolazione - PieRicSintomi - PieTotOsped - PieGuariti - PieIsolamento - PieDeceduti - 200;
E0=PieRicSintomi;
I0=PieTotOsped;
R0=PieGuariti + PieIsolamento + PieDeceduti + 200;
x0=[S0 E0 I0 R0]';N0=sum(x0);

%%% Incertezze dei parametri %%%
%dd=ones(6,1);
dd=rand(6,1)/2.5-.2+1;
%dd=rand(6,1)/5-.1+1;
dmu=dd(1);dgam=dd(2);dsig=dd(3);dw=dd(4);dni=dd(5);dbet=dd(6);
mu=dmu*mun;gam=dgam*gamn;sig=dsig*sign;w=dw*wn;ni=dni*nin;bet=dbet*betn;

ic=0; %%% Nessuna vaccinazione

sim('epidemia')

figure(1)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Piemonte - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(2)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[days]'),legend('Vaccinazione')
title({'Piemonte - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=0 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

ic=1; %%% Con vaccinazione

sim('epidemia')

figure(3)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,Nr),grid,xlabel('t[giorni]'),legend('S','E','I','R','Nr')
title({'Piemonte - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 - Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
pause

figure(4)
subplot(2,1,1)
plot(t,V),grid,xlabel('t[giorni]'),legend('Vaccinazione')
title({'Piemonte - Dal 9 Marzo 2020 - Diffusione COVID-19 - Senza Misure di Contenimento ';['ic=1 -Variazioni parametriche: d\mu=',num2str((dmu-1)*100),'%, ','d\gamma=',num2str((dgam-1)*100),'%, ','d\sigma=',num2str((dsig-1)*100),'%, ',...
'dw=',num2str((dw-1)*100),'%, ','d\nu=',num2str((dni-1)*100),'%, d\beta=',num2str((dbet-1)*100),'%']})
subplot(2,1,2)
plot(t,e./Nr*100),grid,xlabel('t[giorni]'),legend('e%')
%i,xmin=min(min(x))
pause

end

