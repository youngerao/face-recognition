function [feature] = GetFeature(Img,m,n)

Img=im2bw(Img);    %二值化处理
[row,col]=find(Img==0);
top=min(row);
bottom=max(row);
left=min(col);
right=max(col);

xStep=floor((right-left)/n);
yStep=floor((bottom-top)/m);
lfeatures=zeros(m,n);
for i=1:m
    for j=1:n
        block=Img(top+(i-1)*yStep:top+i*yStep,left+(j-1)*xStep:left+j*xStep);
        nPixel=numel(block);
        tmpFeature=sum(sum(block))/(nPixel);
        feature=1-tmpFeature;
        lfeatures(i,j)=feature;
    end
end

feature=reshape(lfeatures, m*n, 1);
end


