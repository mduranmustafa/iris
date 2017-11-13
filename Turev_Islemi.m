
function [b,r,blur]=Turev_Islemi(I,C,Yari_Cap_Min,Yari_Cap_Max,sigma,n,part)
R=Yari_Cap_Min:Yari_Cap_Max;
count=size(R,2);
for k=1:count
[L(k)]=Integral_Hesabi(I,C,R(k),n,part);
if L(k)==0

     L(k)=[];
    break;
end
end
D=diff(L);
D=[0 D];

if strcmp(sigma,'inf')==1
f=ones(1,7)/7;
else
f=fspecial('gaussian',[1,5],sigma);
end
blur=convn(D,f,'same');
blur=abs(blur);
[b,i]=max(blur);
r=R(i);
b=blur(i);
