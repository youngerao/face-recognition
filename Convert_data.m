clear all;clc;
%转换数据样本
%总共40类
%取每类前面5个为训练样本
%剩余2个作为测试样本
strSamples='patternPca';
load(strSamples,'patternPca');
nClass=length(patternPca);       %总共有40类数据
for i=1:nClass
    [~,nSamples(i)]=size(patternPca(i).feature);
end

trN=5;
train_x=[];
train_y=[];
test_x=[];
test_y=[];

for i=1:nClass
train_x=[train_x ; patternPca(i).feature(:, 1:nSamples(i))'];
train_y=[train_y ; patternPca(i).label*ones(nSamples(i),1)];

test_x=[test_x;  patternPca(i).feature(:, trN+1:nSamples(i))'];
test_y=[test_y;  patternPca(i).label*ones(nSamples(i)-trN, 1)];
end
save('data.mat' , 'train_x', 'train_y', 'test_x', 'test_y');
disp('completed !');
