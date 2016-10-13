load('fisheriris');
S = species;
M = meas;
ord = unique(S); 
cvp = cvpartition(y,'k',10); 
fin = @(xtr,ytr,xte,yte)confusionmat(yte,...
classify(xte,xtr,ytr),'order',ord);
        confmat = crossval(f,X,y,'partition',cvp);
confmat = reshape(sum(confmat),3,3)
stats = confusionmatStats(confmat);
stats.accuracy
stats.Fscore
stats = confusionmatStats(confmat);
stats.accuracy
stats.Fscore
