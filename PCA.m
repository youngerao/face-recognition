function  [Y , U]= PCA(nStr, K)
%YΪ�õ��Ľ�ά����
%UΪ��������
%nStrΪ��������
%KΪ�뽵����ά��
load(nStr,'pattern');   %��������
nClass=length(pattern);

for iter=1:nClass
    [~,tmpCol]=size(pattern(iter).feature);
    nSamples(iter)=tmpCol;
end

Sum=0;
%���ֵ
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

%ȥ��ֵ
new_data=data-mean;

C=(1.0/(tmpCol*nClass)).*(new_data*new_data');  %Э�������
[V,D]=eig(C);      %VΪ����������DΪ����ֵ
[~,ind]=sort(diag(D),'descend');   %������ֵ���н�������
Vs=V(:,ind);   %������������

U=Vs(:,1:K);    %����25ά
Y=U'*data;   %�õ�25ά����
U=U';              %������������
end

