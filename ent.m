function result = ent(Y)
 tab = tabulate(Y);
prob = tab(:,3) / 100;
prob = prob(prob~=0);
result = -sum(prob .* log2(prob));


