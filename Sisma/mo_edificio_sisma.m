
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calcola e visualizza i modi naturali di un edifico a due piani %%%
%%% e simula le oscillazioni prodotte da un'azione sismica e       %%%
%%% quelle da un segnale chirp                                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano - modificato da Antonio Romano

clc, clear all, close all

% Dati dell'edificio in muratura ordinaria
M1=1e5;   % massa totale del primo solaio  
M2=.5e5;  % massa totale del secondo solaio 
Ka1=4e4;  % coefficiente di attrito del primo piano 
Ka2=2e4;  % coefficiente di attrito del secondo piano
Ke1=1e6;  % rigidezza del primo piano
Ke2=.5e6; % rigidezza del secondo piano
H1=3.75;  % quota del primo solaio
H2=7.5;   % quota del secondo solaio

% Modello (analogo a quello delle sospensioni di un autoveicolo
% cfr. Esempio 3.27 Voll. II) 
M=[M1 0;0 M2]; Ka=[Ka1+Ka2 -Ka2;-Ka2 Ka2];
Ke=[Ke1+Ke2 -Ke2;-Ke2 Ke2];Hd=[Ka1;0];Hp=[Ke1;0];
Mi=inv(M);A1=Mi*Ka;A2=Mi*Ke;B1=Mi*Hd;B2=Mi*Hp;
A=[zeros(2,2) eye(2);-A2 -A1];B=[B1;B2-A1*B1];
C=[eye(2) zeros(2,2)];D=zeros(2,1);

open('edsis.fig')
figure(1)
pause(3)
%break

% Risposta in frequenza
f=0:.25e-2:2; w=2*pi*f;M=bode(A,B,C,D,1,w);

subplot(2,1,1)
plot(f,M(:,1)),grid,xlabel('f[Hz]'),ylabel('s_1[m]')
title('Risposta in frequenza del primo solaio')
subplot(2,1,2)
plot(f,M(:,2)),grid,xlabel('f[Hz]'),ylabel('s_2[m]')
title('Risposta in frequenza del secondo solaio')
pause(2)

% Disegno dell'edificio
F=[0.1^3 0.1^2 0.1 1;H1^3 H1^2 H1 1;3*0.1^2 2*.1 1 0;3*H1^2 2*H1 1 0];G1=inv(F);
x1=[0.1:.05:H1]';G1=[x1.^3 x1.^2 x1 x1*0+1]*G1;G1=G1(:,1:2);
F=[(H1+.2)^3 (H1+.2)^2 H1+.2 1;H2^3 H2^2 H2 1;3*(H1+.2)^2 2*(H1+.2) 1 0;3*H2^2 2*H2 1 0];G2=inv(F);
x2=[H1+.2:.05:H2]';G2=[x2.^3 x2.^2 x2 x2*0+1]*G2;G2=G2(:,1:2);
L=10;
xy=[-10 10 0 9];

% Autovalori ed autovettori
[vv ll]=eig(A);
v2=50*real(vv(:,1));v1=50*real(vv(:,3));w2=imag(ll(1,1));w1=imag(ll(3,3));
% Visualizzazione dei modi
figure(1)
subplot(1,1,1)
for j=0:39
s=sin(pi/8*j);
u=0;y1=v1(1)*s;y2=v1(2)*s;
s1=G1*[u; y1];
s2=G2*[y1; y2];
plot([0 L L 0 0]+u-L/2,[L/1000 L/1000 L/100 L/100 L/1000],'r', ...
[0 L L 0 0]+y1-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H1,'r', ...
[0 L L 0 0]+y2-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H2,'r', ...
s1-.48*L,x1,'r',s1,x1,'r',s1+.48*L,x1,'r', ...
s2-.48*L,x2,'r',s2,x2,'r',s2+.48*L,x2,'r','LineWidth',2)
title(['Modo 1  f_1=',num2str(round(w1/2/pi*1000)/1000),'Hz']),axis(xy)
pause(.1)
end
pause(2)
figure(1)
subplot(1,1,1)
for j=0:39
s=sin(pi/8*j);
u=0;y1=v2(1)*s;y2=v2(2)*s;
s1=G1*[u; y1];
s2=G2*[y1; y2];
plot([0 L L 0 0]+u-L/2,[L/1000 L/1000 L/100 L/100 L/1000],'r', ...
[0 L L 0 0]+y1-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H1,'r', ...
[0 L L 0 0]+y2-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H2,'r', ...
s1-.48*L,x1,'r',s1,x1,'r',s1+.48*L,x1,'r', ...
s2-.48*L,x2,'r',s2,x2,'r',s2+.48*L,x2,'r','LineWidth',2)
title(['Modo 2  f_2=',num2str(round(w2/2/pi*1000)/1000),'Hz']),axis(xy)
pause(.08)
end
pause(2)

% Risposta a un'azione pseudosismica della durata di 10s
t1=0:1e-2:10;u1=sin(t1.^2/2);t2=10.01:1e-2:35;u2=t2*0;t=[t1 t2];u=[u1 u2];
y=lsim(A,B,C,D,u,t);y1=y(:,1);y2=y(:,2);

% Animazione della risposta
figure(1)
subplot(1,1,1)
for i=1:10:length(t)
s1=G1*[u(i); y1(i)];
s2=G2*[y1(i); y2(i)];
plot([0 L L 0 0]+u(i)-L/2,[L/1000 L/1000 L/100 L/100 L/1000],'r', ...
[0 L L 0 0]+y1(i)-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H1,'r', ...
[0 L L 0 0]+y2(i)-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H2,'r', ...
s1-.48*L,x1,'r',s1,x1,'r',s1+.48*L,x1,'r', ...
s2-.48*L,x2,'r',s2,x2,'r',s2+.48*L,x2,'r','LineWidth',2)
title(['Risposta ad un''azione sismica della durata di 10s' ...
'   t=',num2str(round(t(i))),'s']),axis(xy)
pause(.08)
end

pause(2)

% Risposta a un segnale chirp
t=0:1e-2:80;u=.5*sin(.1*t.^2/2);
y=lsim(A,B,C,D,u,t);y1=y(:,1);y2=y(:,2);

% Animazione della risposta
figure(1)
subplot(1,1,1)
for i=1:10:length(t)
s1=G1*[u(i); y1(i)];
s2=G2*[y1(i); y2(i)];
plot([0 L L 0 0]+u(i)-L/2,[L/1000 L/1000 L/100 L/100 L/1000],'r', ...
[0 L L 0 0]+y1(i)-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H1,'r', ...
[0 L L 0 0]+y2(i)-L/2,[L/1000 L/1000 L/50 L/50 L/1000]+H2,'r', ...
s1-.48*L,x1,'r',s1,x1,'r',s1+.48*L,x1,'r', ...
s2-.48*L,x2,'r',s2,x2,'r',s2+.48*L,x2,'r','LineWidth',2)
title(['Risposta ad un chirp (azione sismica a frequenza crescente)' ...
'   t=',num2str(round(t(i))),'s']),axis(xy)
pause(.08)
end

