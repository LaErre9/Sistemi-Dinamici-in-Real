
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Simula un robot planare controllato                        %%%
%%% per "tracciare" diverse traiettorie con velocità assegnate %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano - modificato da Antonio Romano

clc, clear all, close all

warning off

global B0 B1 M L LG 

% Dati del robot

n=2; %numero bracci
Lb1=0.3;m1=7;M1m=0;M1p=0.5;I1m=0;I1p=0;
Lb2=0.4;m2=5;M2m=0;M2p=0.5;I2m=0;I2p=0;

% Traiettorie desiderate:


% Logo VESUVIO
ve=1;if ve==1
fs=100; % fattore di scala
x0=30;y0=0; % coordinate del punto di partenza

XT=[16.97 15.23 13.44 10.21 5 3.12 2.26 1.96 2.15 2.7 3.28 3.84 4.66 5.29 6 6.58 ...
    7.26 7.91 8.47 8.89 9.29 9.71 10.08 10.47 10.9 11.61 12.13 12.57 13 13.44 13.81 14.39 15.15 ...
    15.98 16.73 17.71 18.89 20.35 19 17.13 15.42 13.81 12.24 10.82 9.36 9.02 9.47 10.49 11 11.49 ...
    12.58 12.87 13.24 13.48 12.92 11.16 10.23 8.99 7.89 7.21 6.15 5.7 5.62 6 6.76 7.87 10.23 12.23 ...
    14.44 16.18 16.97]/fs;

YT=[3.36 3.29 3.31 3.49 4 4.47 5.11 5.82 6.52 6.95 7.18 7.37 7.57 7.78 8 8.34 8.74 9.19 9.58 9.86 9.98 10.02 ...
    9.84 9.74 9.81 10.15 10.27 10.19 10 9.69 9.39 9.1 8.76 8.5 8.34 8.28 8.23 8.11 8 7.95 7.89 7.86 7.71 7.61 7.49 7.34 7.19 7.07 ...
    7 7.28 7.29 7.07 7.03 6.87 6.81 6.81 6.79 6.7 6.57 6.42 6.11 5.78 5.44 5.16 4.86 4.57 4.2 3.95 3.7 3.49 3.36]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end

% Triangolo
tr=0;if tr==1
TT=[0 5 10 20]';
XT=[.2 .45 .45 .2]';
YT=[0.1 0.1 .3 0.1]';
TF=TT(end);
end

% Albero di Natale
al=0;if al==1
fs=100; % fattore di scala
x0=30;y0=0; % coordinate del punto di partenza

XT=[0 2.50 4.00 1.00 1.00 10.00 1.00 8.50 1.00 7.50 0 0 2.00 1.00 2.20 0.70 ...
    0 -0.70 -2.20 -1.00 -2.00 0 0 -7.50 -1.00 -8.50 -1.00 -10.00 -1.00 -1.00 -4.00 -2.50 0]/fs;

YT=[0 0 5.00 5.00 9.50 8.00 14.00 12.50 18.00 16.00 22.50 24.50 23.50 25.40 26.70 26.70 ...
    28.80 26.70 26.70 25.40 23.50 24.50 22.50 16.00 18.00 12.50 14.00 8.00 9.50 5.00 5.00 0 0]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end


% Cuore
cu=0;if cu==1
fs=100; % fattore di scala
x0=25;y0=0; % coordinate del punto di partenza

XT=[-0.06 1.41 2.64 3.07 2.92 2.42 1.53 0.15 -1.15 -1.85 -2.15 -2.81 -3.76 ...
    -5.17 -6.19 -6.56 -6.54 -5.92 -4.71 -2.45 -0.06]/fs;

YT=[0.24 2.45 4.85 6.52 8.03 8.93 9.73 10.08 9.53 8.82 8.02 8.56 8.83 8.66 ...
    7.66 6.52 5.49 4.11 2.88 1.41 0.24]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end

XY=[min(XT)-.05 max(XT)+.05 min(YT)-.05 max(YT)+.05];
figure(1),plot(XT,YT),axis('equal'),axis(XY),title('Traiettoria desiderata nello spazio X - Y'),pause

% Inversione cinematica (Calcolo di bet1r,beta2r)

sim('xTyTbeta1beta2')

figure(2)
plot(beta1r,beta2r),title('Traiettoria desiderata nello spazio \beta_1_r - \beta_2_r')
pause
figure(3)
plot(tt,beta1r,tt,beta2r),grid,legend('\beta_1_r','\beta_2_r'),xlabel('t[s]')
pause

% Calcolo dei parametri del modello

M=zeros(1,n);
I=zeros(1,n);

L=[Lb1 Lb2];
m=[m1 m2];
MM=[M1m M2m];
MP=[M1p M2p];
IM=[I1m I2m];
IP=[I1p I2p];

for i=1:n
M(i)=MM(i)+m(i)*L(i)+MP(i);
I(i)=IM(i)+IP(i)+m(i)*L(i)^3/3+MP(i)*L(i)^2;
LG(i)=(m(i)*L(i)^2/2+MP(i)*L(i))/M(i);
end

B0=[I(1)+I(2)+M(2)*L(1)^2 I(2);I(2) I(2)];
B1=[2*M(2)*L(1)*LG(2) M(2)*L(1)*LG(2);M(2)*L(1)*LG(2) 0];

% Progetto dei controllori PD

beta2=linspace(min(beta2r)*1.2,max(beta2r)*1.2,101);
%beta2=linspace(-pi,pi,101);
Lm=[];LM=[];
r2m=min(beta2);r2M=max(beta2);
bet2=linspace(r2m,r2M,51);
for k=1:length(bet2)
B=B0+B1*cos(bet2(k));l=eig(B);
Lm=[Lm min(l)];LM=[LM max(l)];
end
lm=min(Lm);lM=max(LM);

h=lM;
a=10;

kp1=h*2*a^2;    % Azione proporzionale
kp2=h*2*a^2;
kd1=h*2*a;      % Azione derivativa
kd2=h*2*a;

beta10=beta1r(1);beta20=beta2r(1);

% Simulazione del robot controllato

tauf=.1;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

L1=Lb1;L2=Lb2;

figure(4)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(5)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(6), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m',xx(i),yy(i),'om')
pause(.075)
end

figure(7)
comet(xx,yy)
pause

%%%%%%%%%%%%

tauf=.5;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

figure(8)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(9)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(10), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m')
pause(.075)
end
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcolo di TT nell'ipotesi di velocità doppia %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TF=60/2;
TT=TT*TF/TT(end);
sim('xTyTbeta1beta2')

tauf=.1/2;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

figure(11)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(12)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(13), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m')
pause(.075)
end

