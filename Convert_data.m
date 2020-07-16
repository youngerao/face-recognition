clear all;clc;
%ת����������
%�ܹ�40��
%ȡÿ��ǰ��7��Ϊѵ������
%ʣ��3����Ϊ��������
strSamples='patternPca';
load(strSamples,'patternPca');
nClass=length(patternPca);       %�ܹ���40������
for i=1:nClass
    [~,nSamples(i)]=size(patternPca(i).feature);
end

trN=7;
train_x=[];
train_y=[];
test_x=[];
test_y=[];

for i=1:nClass
train_x=[train_x ; patternPca(i).feature(:, 1:trN)'];
train_y=[train_y ; patternPca(i).label*ones(trN,1)];

test_x=[test_x;  patternPca(i).feature(:, trN+1:nSamples(i))'];
test_y=[test_y;  patternPca(i).label*ones(nSamples(i)-trN, 1)];
end
save('data.mat' , 'train_x', 'train_y', 'test_x', 'test_y');
disp('completed !');
