function [u,fs] = violin(keynum,t)

%极为糟糕的声音
L=0.2;
f = 440 * (2^( (keynum-49)/12 ));
c=2*L*f;
fs = 11025; 
%t = 0:1/fs:2;
u=0;
alpha=(L/2)/c;
for k = 1:5
    
%k=1;
%音色计算，基于数学物理方程
A=5;
    u = u+(2*A*L^2/(k^2*pi^2*c*alpha*(L-c*alpha)))*sin(k*pi*c*alpha/L).*sin(((k)*pi/L)*L/2).*cos(((k)*pi*c/L)*t)/(sin(k*pi*L/(L*2)));
    %u=cos(((k)*pi*c/L)*t);
    %u=cos(2*pi*f*t);
    %u = u+((-1)^k).*(8/((2*k+1)^2*pi^2)).*sin(((2*k+1)*pi/L)*L/2).*cos(((2*k+1)*2*pi*f)*t);
    
end
u=u.*exp(-10*t);
