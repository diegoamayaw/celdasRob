matriz = xlsread('algoritmoMatlab');
[ren,col]=size(matriz);
for i=1:ren
    for j=1:col
        if matriz(i,j)~= 1
            matriz(i,j)=0;
        end
    end
end
m1=zeros(ren,ren);

for i=1:ren
    for j=1:ren
        if i~=j
            m1(i,j)=(matriz(j,:)*matriz(i,:)')/min(sum(matriz(j,:)),sum(matriz(i,:)));
        else
            m1(i,j)="X";
        end
    end
end
m1
m1=tril(m1,-1);
r=zeros(1,0);
maxim=rmmissing(unique(m1));

for k=2:length(maxim)
    for i=1:ren
        for j=1:ren
            if i~=j && m1(i,j)~=0 && m1(i,j)==maxim(k)
               r=cat(2,r,i);
               r=cat(2,r,j);
               r=cat(2,r,maxim(k));
            end
        end
    end
end
r=vec2mat(r,3);
r=flipud(r)
fprintf("Primera celda formada por máquina %d y %d con prob de %d",r(1,1),r(1,2),r(1,3));

