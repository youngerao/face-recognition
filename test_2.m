clear all;clc;

str='��������\ORL\s31_6.bmp';
load('data.mat' ,'train_x', 'train_y');
strSamples='patternPca';
load(strSamples,'patternPca');

img=imread(str);
Img=GetFeature(img,10,10);
Img=(patternPca(1).U*Img)';
label=0;       %��Ϊδ֪��ǩ�����������ʼ������

model=svmtrain(train_y,train_x, '-s 1 -c 1 -g 0.07');
[predict_label]=svmpredict(label,Img,model);
fprintf('������������ǵ�%d��\n', predict_label);

