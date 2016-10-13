m = csvread('fruits.csv',1,1);
labels = {'Banana','Orange','Other Fruit'};
long = m(:,[1,2]);
sweet = m(:,[3,4]);
yellow = m(:,[5,6]);

prior_prob = sum(long,2)/1000;

evidence = [sum(long(:,1),1);sum(sweet(:,1),1);sum(yellow(:,1),1)];
evidence_prob = sum(evidence,2)/1000;

rc = size(m);
likelihood = zeros(rc);

row_sum = sum(m(:,:),2)/3;
for num_row = 1:rc(1)
        for num_col = 1:rc(2)
                likelihood(num_row,num_col) = m(num_row,num_col)/row_sum(num_row);
        end;
end;

%P(Banana/Long, Sweet and Yellow)
like = zeros(3,1);
prob1_evidence = evidence_prob(1)*evidence_prob(2)*evidence_prob(3);
for num_row = 1:3
    like(num_row,1) = likelihood(num_row,1)*likelihood(num_row,3)*likelihood(num_row,5)*prior(1);
end
prob1 = likelihood(1,1)*likelihood(1,3)*likelihood(1,5)*prior(1);
final1 = like/prob1_evidence;
[m,i] = max(final1);
labels(i)
m


%pLong, not Sweet and not Yellow
prob2_evidence = evidence_prob(1)*(1-evidence_prob(2))*(1-evidence_prob(3));
like = zeros(3,1);
for num_row = 1:3
    like(num_row,1) = likelihood(num_row,1)*likelihood(num_row,4)*likelihood(num_row,6)*prior(1);
end
prob2 = likelihood(1,1)*likelihood(1,4)*likelihood(1,6)*prior(1);
final2 = like/prob1_evidence;
[M,I] = max(final2);
labels(I)
M
%p not Long, Sweet, and Yellow
prob3_evidence = (1 - evidence_prob(1))*evidence_prob(2)*evidence_prob(3);
like = zeros(3,1);
for num_row = 1:3
    like(num_row,1) = likelihood(num_row,2)*likelihood(num_row,3)*likelihood(num_row,5)*prior(1);
end
prob3 = likelihood(1,2)*likelihood(1,3)*likelihood(1,5)*prior(1);
final3 = like/prob1_evidence;

[M,I] = max(final3);
labels(I)
M