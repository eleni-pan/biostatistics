% Caffeine amount in coffee cups in mg
sample = [317, 305, 465, 498, 517, 353, 357, 410];

% Normality test (given we have very little data)
% defaul alpha value 0.05

[h, p, lstat, cv] = lillietest(sample);

% The null hypothesis cannot be rejected. 

% We can proceed with hypothesis test for the mean value when the
% population variance is unknown 

[h_mean, p_mean, ci, s] = ttest(sample, 400);

% h_mean = 0, the null hypothesis cannot be rejected
% the sample comes from a population with mean 400