
function [ci,cp,Segmente_Edilmis]=Iris_Segmentasyon(I,Yari_Cap_Min,Yari_Cap_Max)


I=im2double(I);

pimage=I;

I=imcomplement(imfill(imcomplement(I),'holes'));

Satir_Sayisi=size(I,1);
Sutun_Sayisi=size(I,2);
[X,Y]=find(I<0.5);

s=size(X,1);
for k=1:s 
    if (X(k)>Yari_Cap_Min)&&(Y(k)>Yari_Cap_Min)&&(X(k)<=(Satir_Sayisi-Yari_Cap_Min))&&(Y(k)<(Sutun_Sayisi-Yari_Cap_Min))
            A=I((X(k)-1):(X(k)+1),(Y(k)-1):(Y(k)+1));
            M=min(min(A));

           if I(X(k),Y(k))~=M
              X(k)=NaN;
              Y(k)=NaN;
           end
    end
end
v=find(isnan(X));
X(v)=[];
Y(v)=[];

index=find((X<=Yari_Cap_Min)|(Y<=Yari_Cap_Min)|(X>(Satir_Sayisi-Yari_Cap_Min))|(Y>(Sutun_Sayisi-Yari_Cap_Min)));
X(index)=[];
Y(index)=[];  

N=size(X,1);

maxb=zeros(Satir_Sayisi,Sutun_Sayisi);
maxrad=zeros(Satir_Sayisi,Sutun_Sayisi);

for j=1:N
    [b,r,blur]=Turev_Islemi(I,[X(j),Y(j)],Yari_Cap_Min,Yari_Cap_Max,'inf',600,'iris');
    maxb(X(j),Y(j))=b;
    maxrad(X(j),Y(j))=r;
end
[x,y]=find(maxb==max(max(maxb)));
ci=Iris_Goz_Bebegi_Ara(I,Yari_Cap_Min,Yari_Cap_Max,x,y,'iris');

cp=Iris_Goz_Bebegi_Ara(I,round(0.1*r),round(0.8*r),ci(1),ci(2),'Goz_Bebegi');

Segmente_Edilmis=Daire_Icine_Al(pimage,[ci(1),ci(2)],ci(3),600);
Segmente_Edilmis=Daire_Icine_Al(Segmente_Edilmis,[cp(1),cp(2)],cp(3),600);