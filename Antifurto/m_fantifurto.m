
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Function fantifurto.m dello schema simulink antifurto.mdl %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano modificato da Antonio Romano

function y=fantifurto(u)

t=0:1e-4:1;s=sin(2*pi*1000*t).*sin(3*pi*t);
b=zeros(100,100);
w=b+256;

if u==1
  for l=1:5
    close
    attenzione = imread('att.jpg');
    
    imshow(attenzione);pause(.5);imshow(attenzione)
    sound(s,1e4);pause(1)
 end
else
   close
   ok = imread('ok.jpg');
   imshow(ok)
end


