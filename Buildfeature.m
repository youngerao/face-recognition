clear all;clc;

folder='ÈËÁ³Ñù±¾';
folder2='ORL';
nClass=40;
nSamples=zeros(nClass,1);
for i=1:nClass
    nSamples(i)=10;
end

for i=1:nClass
    for j=1:nSamples(i)
        str=[folder '\' folder2 '\'  's' num2str(i) '_' num2str(j) '.bmp'];
        Img=imread(str);
        pattern(i).feature(:, j)=GetFeature(Img,10,10);
        pattern(i).label=i;
    end
end
disp('Feature extraction completed!');
save('pattern.mat','pattern');