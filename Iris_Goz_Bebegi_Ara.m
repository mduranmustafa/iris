function [cp]=Iris_Goz_Bebegi_Ara(im,Yari_Cap_Min,Yari_Cap_Max,x,y,option)
Satir_Sayisi=size(im,1);
Sutun_Sayisi=size(im,2);
R=Yari_Cap_Min:Yari_Cap_Max;
maxrad=zeros(Satir_Sayisi,Sutun_Sayisi);
maxb=zeros(Satir_Sayisi,Sutun_Sayisi);
for i=(x-5):(x+5)
    for j=(y-5):(y+5)
        [b,r,blur]=Turev_Islemi(im,[i,j],Yari_Cap_Min,Yari_Cap_Max,0.5,600,option);
        maxrad(i,j)=r;
        maxb(i,j)=b;
    end
end
B=max(max(maxb));
[X,Y]=find(maxb==B);
Yari_Cap=maxrad(X,Y);
cp=[X,Y,Yari_Cap];