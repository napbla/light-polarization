function [r g b] = changeSaturation(R,G,B,change)
Pr  = 0.299;
Pg  = 0.587;
Pb  = 0.114;
P=sqrt(R*R*Pr+G*G*Pg+B*B*Pb);

r=P+(R-P)*change;
b=P+(B-P)*change;
g=P+(G-P)*change;
