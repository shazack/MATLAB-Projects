function out_data = out_data(test_data,tr_data,k)
    test_data_n = size(test_data,1);
    tr_data_n = size(tr_data,1);

for sample=1:numoftestdata

    % absolute distance between all test and training data
    R = repmat(test_data(sample,:),numoftrainingdata,1) ;
   euclideandistance  = (R(:,1) - tr_data(:,1)).^2;

   %Step 2: compute k nearest neighbors and store them in an array
    [dist position] = sort(euclideandistance,'ascend');
    knearestneighbors=position(1:k);
    knearestdistances=dist(1:k);

    % mode of k nearest
    val = reshape(tr_data(knearestdistances,2),[],k);
    out_data = mode(val,2);
    % if mode is 1, output nearest instead
    out_data(out_data==1) = val(out_data==1,1);
end