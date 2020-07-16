clear all;clc;

str='人脸样本\ORL\s31_6.bmp';
load('data.mat' ,'train_x', 'train_y');
strSamples='patternPca';
load(strSamples,'patternPca');

img=imread(str);
Img=GetFeature(img,10,10);
Img=(patternPca(1).U*Img)';
label=0;       %因为未知标签，所以随意初始化即可

model=svmtrain(train_y,train_x, '-s 1 -c 1 -g 0.07');
[predict_label]=svmpredict(label,Img,model);
fprintf('你输入的人脸是第%d个\n', predict_label);

