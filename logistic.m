function logistic()
B = dataset('file','dataset1.csv','delimiter',',');
rows = dataset2cell(B(1,1:4));
rows=rows(1,1:4);
data = double(B(1:size(B),1:4));
n=[0.001,0.01,0.1,0.5];
ind=1;
EP=5;
x=[0,0,0];
w=[0,0,0];
y=[0,0,0];
iter=0;
wd=0;
xa=[0];
ya=[0];
for count=1:4
    iter=0;
    xa=[0];
    ya=[0];
    for i=1:100
        for j=1:3
            w(j)=(randi([0,10])/100);
            x(j)=data(i,j)*w(j);
            y(j)=1/(1+exp(-1*( w(j)*x(j) +wd)));
        end
        r=data(i,4);
        wd=wd+(n(count)*((r-y(1))+(r-y(2))+(r-y(3))));
        E=-1*((r*log(y(1))+((1-r)*(log(1-y(1)))))+(r*log(y(2))+((1-r)*(log(1-y(2)))))+(r*log(y(3))+((1-r)*(log(1-y(3))))));
        iter=iter+1;
        if (abs(EP-E)<0.004)
            figure(count);
            plot(xa,ya);
            break;
        else
            EP=E;
            xa(iter)=iter;
            ya(iter)=E;
        end
    end
end
