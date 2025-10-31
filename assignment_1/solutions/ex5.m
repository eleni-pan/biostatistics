% The time it takes each sample (a: Lactobacillus acidophilus,
% b: Lactobacillus bulgarius) in making the product.
% Normality and independence assumptions for both samples are fulfilled.
sample_a = [7.3, 6.9, 8.2, 6.1, 6.3, 7.4, 6.8];
sample_b = [6.4, 6.1, 6.7, 6.9, 6.3, 5.7, 5.5];

% We need to test also the validity of the assumption of equality of
% variances.


% Creating our input matrix of the data for the vartestn() function.
x = [sample_a', sample_b'];

% Ho: V1 = V2
[p_var,stats_var] = vartestn(x);

% Since p = 0.4255 > 0.05, the null hypothesis cannot be rejected. This
% means that out two populations have equal variances. 

% Having satisfied the requirements before using hypothesis test for the
% mean value of two samples, we now proceed with the analysis for samples 
% that have unknown but equal variances (ttest2).
[h, p, ci, stats] = ttest2(sample_a, sample_b, 0.05, 'both');


% Calculating the mean time for product making of each species of
% Lactobacillus
mean_a = mean(sample_a);
mean_b = mean(sample_b);

% One-tailed hypothesis test to the right
[h1, p1, ci1, stats1] = ttest2(sample_a, sample_b, 0.05, 'right');