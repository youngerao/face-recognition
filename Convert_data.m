clear all;clc;
%ת����������
%�ܹ�40��
%ȡÿ��ǰ��5��Ϊѵ������
%ʣ��2����Ϊ��������
strSamples='patternPca';
load(strSamples,'patternPca');
nClass=length(patternPca);       %�ܹ���40������
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

model=svmtrain(train_y,train_x, '-s 1 -c 1 -g 0.07');
[predict_label]=svmpredict(test_y,test_x,model);
%��ӡ���Է�����
figure;
hold on;
plot(test_y,'o');
plot(predict_label,'r*');
legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');
title('���Լ���ʵ�ʷ����Ԥ�����ͼ','FontSize',10);