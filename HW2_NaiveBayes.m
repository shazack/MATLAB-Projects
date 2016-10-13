% HW2_NaiveBayes({'Long','Sweet','Yellow'})
% HW2_NaiveBayes({'Long','Not_Sweet','Not_Yellow'})
% HW2_NaiveBayes({'Not_Long','Sweet','Yellow'})
function HW2_NaiveBayes(data)

B = dataset('file','fruits.csv','delimiter',',');
labels = dataset2cell(B(1:size(B),1));
labels = labels(2:size(labels),1);
header = dataset2cell(B(1,2:size(B,2)));
header = header(1,:);
numericdata = double(B(1:size(B),2:size(B,2)));
finaResult = zeros(3,1);
for i= 1:size(labels,1)
    prob = 1;
    prior = (sum(numericdata(i,:))/3)/(1000);
    for k = 1:size(data,2)
        colIndex = find(ismember(header,data{1,k}));
        rowIndex = i;
        % Adding one for smoothing
        prob = prob * (numericdata(rowIndex,colIndex))/((sum(numericdata(i,:))/3));
    end
    finaResult(i) = prior * prob;
end
disp(finaResult);
[value,index] = max(finaResult);
disp('Final prediction is ');
disp(labels(index));
