

for i=1:1000  %Run this until convergence                          %error stoping criteria 
  [out, err] = logisticDiscrimination(0.75,i); % Iteration counter increment
  i
  err
  hold on
  plot(i,err) 
end
