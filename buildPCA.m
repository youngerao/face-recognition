clear all;clc;

nStr='pattern.mat';
load(nStr,'pattern');
nClass=length(pattern);
for iter=1:nClass
    [~,tmpCol]=size(pattern(iter).feature);
    nSamples(iter)=tmpCol;
end
K=30;

[Y,U]=PCA(nStr,K);
n=0;
for i=1:nClass
    for j=1:nSamples(i)
        patternPca(i).feature(:, j)=Y(:,j+n);
    end 
    n=n+7;
    patternPca(i).label=i;
end
    patternPca(1).U=U;
disp('Feature  PCA completed!');
save('patternPca.mat','patternPca');
