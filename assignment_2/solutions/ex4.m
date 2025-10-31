%Introduce the data
age = [12, 14, 18, 24, 26, 29, 32, 35, 38, 40, 43, 46, 49, 52, 58, 62, 63, 66, 68, 69]';
trigl_conc = [28, 53, 107, 88, 91, 61, 98, 80, 130, 53, 83, 95, 112, 126, 84, 120, 195, 166, 153, 92]';

%% QUERY a
%Plot the values 
hold on
scatter(age, trigl_conc, 'blue', 'filled');
xf = [min(age)-5, max(age)+5];
plot(xf, polyval(polyfit(age,trigl_conc,1), xf));
xlabel('Age (years)');
ylabel('Triglyceride Concentration (mg/L)');
title('Triglyceride Concentration vs Age');
grid on;
hold off

%% QUERY b
%Regression line
X = [ones(size(age)) age];
C = regress(trigl_conc, X);

%Calculate standardized and studentized error
mystats = regstats(trigl_conc, age, 'linear', {'standres', 'studres'});

%Check for normality
qqplot(mystats.standres);

%Assess prerequisites
yest= X*C;

%Create scatterplot to assess equality of variances
scatter(yest, mystats.studres);

%% Query c
%Calculate R^2
[c, cint, r, rint, stats] = regress(trigl_conc, X);

r_squared = stats(1);

%% Query d
%Predicted values of triglycerides at the ages of 5, 35, 65, 95.
Xtest = [5, 35, 65, 95]';

yest_test = [ones(size(Xtest)) Xtest] * C;

%% Query e
%the p-value is the third variable of the vector 'stats'
p_value = stats(3);