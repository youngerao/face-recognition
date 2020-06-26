function  [Y , U]= PCA(nStr, K)
%Y为得到的降维数据
%U为特征向量
%nStr为输入数据
%K为想降到的维数
load(nStr,'pattern');   %加载数据
nClass=length(pattern);

for iter=1:nClass
    [~,tmpCol]=size(pattern(iter).feature);
    nSamples(iter)=tmpCol;
end

Sum=0;
%求均值
for i=1:nClass
        Sum=Sum+sum(pattern(i).feature,2);
end
mean=Sum/(tmpCol*nClass);

data=[];
for i=1:nClass
    for j=1:tmpCol
        data=[data,pattern(i).feature(:, j)];
    end
end

%去均值
new_data=data-mean;

C=(1.0/(tmpCol*nClass)).*(new_data*new_data');  %协方差矩阵
[V,D]=eig(C);      %V为特征向量，D为特征值
[~,ind]=sort(diag(D),'descend');   %对特征值进行降序排列
Vs=V(:,ind);   %更新特征向量

U=Vs(:,1:K);    %降到25维
Y=U'*data;   %得到25维数据
U=U';              %返回特征向量
end

