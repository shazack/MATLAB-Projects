load fisheriris

% Print using gscatter "Sepal Length vs Sepal Width" 
gscatter(meas(:,1), meas(:,2), species, [], [], [], 'on', 'Sepal Length', 'Sepal Width')
title('Sepal Length vs Sepal Width'), grid on

% Print using gscatter "Sepal Length vs Sepal Width" 
gscatter(meas(:,1), meas(:,2), species, [], [], [], 'on', 'Petal Length', 'Petal Width')
title('Petal Length vs Petal width'), grid on

% Box plot for lengths - Sepal and Petal
flowerLens = meas(:, [1, 3]);   % Define a variable for sepal and petal lengths
figure
boxplot(flowerLens, 'Label', {'Sepal', 'Petal'})  % Show boxplots of lengths
ylabel('Length in mm')
title('Comparison of sepal and petal lengths for Fisher iris data')

% Comparison of different species by length
sepalLens = meas(:, 1);        % Define a variable for the sepal length
figure
boxplot(sepalLens, species)    % The species vector specifies the group
ylabel('Sepal length in mm')
title('Comparison of three species in the Fisher iris data')

% Rose chart
theta = meas(:,4);
figure
rose(theta,12)