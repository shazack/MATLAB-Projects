%% fisher iris example
%% load data
load fisheriris
gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
xlabel('Sepal length');
ylabel('Sepal width');

%% linear classification
linclass = classify(meas(:,1:2),meas(:,1:2),species);
bad = ~strcmp(linclass,species);
numobs = size(meas,1);

% how many are wrongly classified?
sum(bad) / numobs

%% which war wrongly classified?
figure
hold on;
gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
xlabel('Sepal length');
ylabel('Sepal width');
plot(meas(bad,1), meas(bad,2), 'kx');
hold off;

%% what are the separating hyperplanes?
[x,y] = meshgrid(4:.1:8,2:.1:4.5);
x = x(:);
y = y(:);
j = classify([x y],meas(:,1:2),species);
gscatter(x,y,j,'grb','sod')


