function [O]=Daire_Icine_Al(I,C,r,n)
if nargin==3
    n=600;
end
Alfa=(2*pi)/n;
Satir_Sayisi=size(I,1);
Sutun_Sayisi=size(I,2);
Acisi=Alfa:Alfa:2*pi;

x=C(1)-r*sin(Acisi);
y=C(2)+r*cos(Acisi);
if any(x>=Satir_Sayisi)||any(y>=Sutun_Sayisi)||any(x<=1)||any(y<=1)
    O=I;
    return
end
for i=1:n
I(round(x(i)),round(y(i)))=1;
end
O=I;