clear all;clc;

load('data.mat' ,'train_x', 'train_y', 'test_x', 'test_y');

%先用测试集对训练出来的样本进行测试
model=svmtrain(train_y,train_x, '-s 1  -c 1 -g 0.07');
[predict_label]=svmpredict(test_y,test_x,model);
%打印测试分类结果
figure;
hold on;
plot(test_y,'o');
plot(predict_label,'r*');
legend('实际测试集分类','预测测试集分类');
title('测试集的实际分类和预测分类图','FontSize',10);
