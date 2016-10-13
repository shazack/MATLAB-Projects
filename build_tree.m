function t = build_tree(X,Y,cols)

inds = {1:size(X,1)}; 
p = 0; 
labels = {}; 
[inds p labels] = split_node(X, Y, inds, p,labels, cols, 1);
t.inds = inds;
t.p = p;
t.labels = labels;



function [inds p labels] = split_node(X, Y, inds, p, labels, cols, node)
if numel(unique(Y(inds{node}))) == 1
    return;
end
if size(unique(X(inds{node},:),'rows'),1) == 1
    return;
end


best_ig = -inf; 
best_feature = 0; 
best_val = 0; 
curr_X = X(inds{node},:);
curr_Y = Y(inds{node});
for i = 1:size(X,2)
    feat = curr_X(:,i);
    vals = unique(feat);
    splits = 0.5*(vals(1:end-1) + vals(2:end));
    if numel(vals) < 2
        continue
    end
    bin_mat = double(repmat(feat, [1 numel(splits)]) < repmat(splits', [numel(feat) 1]));
    H = ent(curr_Y);
    H_cond = zeros(1, size(bin_mat,2));
    for j = 1:size(bin_mat,2)
        H_cond(j) = cond_ent(curr_Y, bin_mat(:,j));
    end
    IG = H - H_cond;
    [val ind] = max(IG);
    if val > best_ig
        best_ig = val;
        best_feature = i;
        best_val = splits(ind);
    end
end
feat = curr_X(:,best_feature);
feat = feat < best_val;
inds = [inds; inds{node}(feat); inds{node}(~feat)];
inds{node} = [];
p = [p; node; node];
labels = [labels; sprintf('%s < %2.2f', cols{best_feature}, best_val); ...
    sprintf('%s >= %2.2f', cols{best_feature}, best_val)];
n = numel(p)-2;
[inds p labels] = split_node(X, Y, inds, p, labels, cols, n+1);
[inds p labels] = split_node(X, Y, inds, p, labels, cols, n+2);


