
% Legge di controllo dell'epidemia 
% G. e L. Celentano

function V=fcontr_epidemia(u)

global mun gamn sign wn nin betn a ic

N=sum(u(3:6));Nrp=u(1);e=u(2);I=u(5);R=u(6);
V=((mun+wn)*R-gamn*I+Nrp-e/a)/N*ic;

end

