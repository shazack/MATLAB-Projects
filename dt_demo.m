
M = csvread('fruits_decisionTree3.csv', ',');
Y = M(:,1);
X = M(:,2:end);
cols = {'len','sweet','color'};
t = build_tree(X,Y,cols);
treeplot(t.p');
title('Decision tree');
[xs,ys,h,s] = treelayout(t.p');
for i = 2:numel(t.p)
	my_x = xs(i);
	my_y = ys(i);
	parent_x = xs(t.p(i));
	parent_y = ys(t.p(i));
	mid_x = (my_x + parent_x)/2;
	mid_y = (my_y + parent_y)/2;
	text(mid_x,mid_y,t.labels{i-1});
    if ~isempty(t.inds{i})
        val = Y(t.inds{i});
        if numel(unique(val))==1
            text(my_x, my_y, sprintf('y=%2.2f\nn=%d', val(1), numel(val)));
        else
          
            text(my_x, my_y, sprintf('**y=%2.2f\nn=%d', mode(val), numel(val)));
        end
    end
end
    