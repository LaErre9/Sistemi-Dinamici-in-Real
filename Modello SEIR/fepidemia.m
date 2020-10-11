
% Modello di diffusione di un'epidemia
% G. e L. Celentano

function Nxp=fepidemia(vx)

global mu gam sig w ni bet

v=vx(1);x=vx(2:5);
N=sum(x);
xp1=-mu*x(1)+w*x(4)+ni*N-bet*x(1)*x(3)/N-N*v;
xp2=-(mu+sig)*x(2)+bet*x(1)*x(3)/N;
xp3=sig*x(2)-(mu+gam)*x(3);
xp4=gam*x(3)-(mu+w)*x(4)+N*v;

Nxp=[N xp1 xp2 xp3 xp4]';

end


