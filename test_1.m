clear all;clc;

load('data.mat' ,'train_x', 'train_y', 'test_x', 'test_y');

%���ò��Լ���ѵ���������������в���
model=svmtrain(train_y,train_x, '-s 1  -c 1 -g 0.07');
[predict_label]=svmpredict(test_y,test_x,model);
%��ӡ���Է�����
figure;
hold on;
plot(test_y,'o');
plot(predict_label,'r*');
legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');
title('���Լ���ʵ�ʷ����Ԥ�����ͼ','FontSize',10);
