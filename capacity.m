function[cycleweight,working,spare]=capacity(cycle,linkweight)
if nargin==1
    global linkweight
end
[r,c]=size(cycle);
for i=1:c
    x=cycle{i};
    y=[];
    [r1,c1]=size(x);
    for j=1:c1-1
        y=cat(2,y,linkweight(x(1,j),x(1,j+1)));
    end
    y=cat(2,y,linkweight(x(1,c1),x(1,1)));
    cycleweight{i}=y;
%     working{i}=sum(y);
    spare{i}=numel(y)*max(y);
    w=0;
    for i1=1:c1-1
        for j=i1+1:c1
            if linkweight(x(1,i1),x(1,j))>0
                w=w+linkweight(x(1,i1),x(1,j));
            end
        end
    end
    working{i}=w;
end