
function [L]=Integral_Hesabi(I,Koordinat,r,n,Neresi)
Alfa=(2*pi)/n;

Satir_Sayisi=size(I,1);
Sutun_Sayisi=size(I,2);
Acisi=Alfa:Alfa:2*pi;
x=Koordinat(1)-r*sin(Acisi);
y=Koordinat(2)+r*cos(Acisi);
if (any(x>=Satir_Sayisi)||any(y>=Sutun_Sayisi)||any(x<=1)||any(y<=1))
    L=0;
    return

end

if (strcmp(Neresi,'Goz_Bebegi')==1)
          s=0;
          for i=1:n
          val=I(round(x(i)),round(y(i)));
          s=s+val;
          end
          
          L=s/n;
end

if(strcmp(Neresi,'iris')==1)
          s=0;
          for i=1:round((n/8))
          val=I(round(x(i)),round(y(i)));
          s=s+val;
          end
          
          for i=(round(3*n/8))+1:round((5*n/8))
          val=I(round(x(i)),round(y(i)));
          s=s+val;
          end
          
          for i=round((7*n/8))+1:(n)
          val=I(round(x(i)),round(y(i)));
          s=s+val;
          end
          
          L=(2*s)/n;
end