function [result] =  knnclassification(k)
load fisheriris
rng(1); 
num = size(meas,1);
idx = randsample(num,5);
train_data = meas(~ismember(1:num,idx),:); % Training data
test_data = meas(idx,:);% sample
Group = species(~ismember(1:num,idx)); %indicates the class

testdatanum = size(test_data,1);
numoftrainingdata = size(train_data,1);

for sample=1:testdatanum

   %Step 1: Computing euclidean distance for each testdata
   R = repmat(test_data(sample,:),numoftrainingdata,1) ;
   euclideandistance  = sqrt(((R(:,1) - train_data(:,1)).^2) + (( R(:,2) - train_data(:,2)).^2)+((R(:,3) - train_data(:,3)).^2)+((R(:,4) - train_data(:,4)).^2));
   [dist, pos] = sort(euclideandistance,'ascend');
   knn=pos(1:k);
   for i=1:k
        x(i) = Group(knn(i));
        %disp(knearestdistances)
   end
    
  
    u = unique(x);
    n = zeros(length(u), 1);
    for iu = 1:length(u)
        n(iu) = length(find(strcmp(u{iu}, x)));
    end
    [~, itemp] = max(n);
    result(sample) = u(itemp);
   
    
    
end
 disp(result)

%Validation
%{
    load fisheriris 
    indices = crossvalind('Kfold',species,k);
    cp = classperf(species);
    for i = 1:k
         test = (indices == i); train = ~test;
         class = classify(meas(test,:),meas(train,:),species(train,:));
         classperf(cp,class,test)
end
%}


    



