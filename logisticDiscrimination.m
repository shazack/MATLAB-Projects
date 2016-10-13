function [out, err] = logisticDiscrimination(run_coeff,iter)
    B = dataset('file','dataset2.csv','delimiter',',');
    labels = dataset2cell(B(1:end,4));
    labels = labels(2:end,1);
    matlabels = cell2mat(labels);
    numericdata = double(B(1:size(B),2:size(B,2)));

    input = numericdata;
    numIn = size(labels,1);
    desired_out = labels;
    err = inf;
    
    bias = -1;
    coeff = run_coeff;
    rand('state',sum(100*clock));
    weights = -1*2.*rand(4,1);
    iterations=iter;
    for i = 1:iterations
         out = zeros(size(labels,1),1);
         for j = 1:numIn
              y = bias*weights(1,1)+...
                   input(j,1)*weights(2,1)+input(j,2)*weights(3,1)+input(j,3)*weights(4,1);
              out(j) = 1/(1+exp(-y));
              yhat = out(j);
              delta = desired_out{j}-out(j);
              weights(1,1) = weights(1,1)+coeff*bias*delta;
              weights(2,1) = weights(2,1)+coeff*input(j,1)*delta;
              weights(3,1) = weights(3,1)+coeff*input(j,2)*delta;
              weights(4,1) = weights(4,1)+coeff*input(j,3)*delta;
              
              errold=err;
              err=-sum(ourlog(matlabels,yhat)+ourlog(1-matlabels,1-yhat));
         end
    end
    %err=-sum(ourlog(matlabels,out)+ourlog(1-matlabels,1-out));
end

function p=g(x)
    % the logistic function. You may want to make it a separate file
    p=1./(1+exp(-x));
end

function l=ourlog(a,b)
    % we use the convention that 0*log(0) is 0.
    f0=find(b==0);
    f1=find(b>0);
    l=zeros(size(b));
    l(f0)=0;
    l(f1)=a(f1).*log(b(f1));
end



