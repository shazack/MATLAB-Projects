
function NaiveBayes(data)

dat = dataset('file','fruits.csv','delimiter',',');
lab= dataset2cell(dat(1:size(dat),1));
lab= lab(2:size(lab),1);
head = dataset2cell(dat(1,2:size(dat,2)));
head = head(1,:);
num = double(dat(1:size(dat),2:size(dat,2)));
final1 = zeros(3,1);
for i= 1:size(lab,1)
    prob = 1;
    prior = (sum(num(i,:))/3)/(1000);
    for k = 1:size(data,2)
        cI = find(ismember(head,data{1,k}));
        rI = i;
        % Adding one for smoothing
        prob = prob * (num(rI,cI))/((sum(num(i,:))/3));
    end
    final1(i) = prior * prob;
end
disp(final1);
[value,index] = max(final1); 
disp('Final prediction is ');
disp(lab(index));
