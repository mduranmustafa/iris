function Baslat

for i=1:4
    Dosya_Ismi_Oku = sprintf('gozler/Img_%d_1_1.jpg',i);
    I = imread(Dosya_Ismi_Oku);
    [ci,cp,Sonuc]=Iris_Segmentasyon(I,40,70);
    Dosya_Ismi_Yaz = sprintf('segmente_edilmis_gozler/Img_%d_1_1.jpg',i);
    imwrite(Sonuc,Dosya_Ismi_Yaz);
end
