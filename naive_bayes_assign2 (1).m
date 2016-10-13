function naive_bayes_assign2(data)

% filename = '~/Documents/USC/SEM2/INF552/Assignments/Assignment3/HW2/fruits.csv';
% M = csvread(filename,1,1);
% disp(M);

filename = '/Users/nisharazack/Documents/MATLAB/fruits.csv';
B = dataset('file',filename,'delimiter',',');
% disp(B(1:size(B),1));
labels = dataset2cell(B(1:size(B),1));
% disp(labels);
labels = labels(2:size(labels),1);
header = dataset2cell(B(1,2:size(B,2)));
header = header(1,:);
disp(header);
numerical_data = double(B(1:size(B),2:size(B,2)));
% disp(numerical_data);
final_result = zeros(3,1);
for i= 1:size(labels,1)
    prob = 1;
%     disp(sum(numerical_data(i,1:2)));
    prior = (sum(numerical_data(i,:))/3)/(1000);
    for k = 1:size(data,2)
        colIndex = find(ismember(header,data{1,k}));
        rowIndex = i;
        % Adding one for smoothing
        prob = prob * (numerical_data(rowIndex,colIndex))/((sum(numerical_data(i,:))/3));
    end
    final_result(i) = prior * prob;
end
disp(final_result);
[value,index] = max(final_result);
disp('Final prediction is ');
disp(labels(index));
