function result = cond_ent(Y, X)
result = 0;
tab = tabulate(X);
tab = tab(tab(:,3)~=0,:);
for i = 1:size(tab,1)
    H = ent(Y(X == tab(i,1)));
    prob = tab(i, 3) / 100;
    result = result + prob * H;
end

