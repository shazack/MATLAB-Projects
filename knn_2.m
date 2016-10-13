function [z] =  knn_2(k)
load fisheriris
rng(1); % For reproducibility
n = size(meas,1);
idx = randsample(n,5);
tr_data = meas(~ismember(1:n,idx),:); % Training data
test_data = meas(idx,:);% Query data
Group1 = species(~ismember(1:n,idx));


%KNN_1 Summary of this function goes here
%   Detailed explanation goes here
numoftestdata = size(test_data,1);
numoftrainingdata = size(tr_data,1);

for sample=1:numoftestdata

   %Step 1: Computing euclidean distance for each testdata
   R = repmat(test_data(sample,:),numoftrainingdata,1) ;
   euclideandistance  = sqrt(((R(:,1) - tr_data(:,1)).^2) + (( R(:,2) - tr_data(:,2)).^2)+((R(:,3) - tr_data(:,3)).^2)+((R(:,4) - tr_data(:,4)).^2));
   %disp(euclideandistance);
   %Step 2: compute k nearest neighbors and store them in an array
   [dist,position] = sort(euclideandistance,'ascend');
    knearestneighbors=position(1:k);
    %disp('knn')
    %disp(knearestneighbors)
    for i=1:k
        x(i) = Group1(knearestneighbors(i));
        %disp(knearestdistances)
    end
    
  
    y = unique(x);
    n = zeros(length(y), 1);
    for iy = 1:length(y)
        n(iy) = length(find(strcmp(y{iy}, x)));
    end
    [~, itemp] = max(n);
    z(sample) = y(itemp);
   
    
    
end
 disp(z)


    



