%% For the purpose of this exercise we assumed that the time of coconut retrieval 
%% belongs to a normal distribution. Given that the boxplots of vartestn do not
%% suggest clearly that the samples are derived from normal distribution populations
%% (the mean is not their median), we leave ena parathuraki open for error in this 
%% analysis. However, with multcompare we can see that if some sample is to differenciate
%% from the others, it's sample one (observation of other monkey).

% Time of coconut retrieval from the other side of the river by wild
% monkeys, given that each group learned to achieve the retrieval by a
% different way (observation of other monkey (sample_a), observation of
% human (sample_b) and banana reward (sample_c)).
sample_a = [7, 13, 3, 8, 9, 2, 8, 7];
sample_b = [15, 13, 7, 8, 6, 13, 7, 9];
sample_c = [6, 9, 3, 9, 5, 1, 3, 10];

% Given: normal distribution, independence (different monkeys in each
% learning method).

% Equality of variances check
% Construct the input matrix (X) for the vartestn() function
X = [sample_a', sample_b', sample_c'];

[p_var, stats_var] = vartestn(X); % Ho: V1 = V2 = V3, two-tailed

% Given the results, we cannot reject the null hypothesis (equal variances)
% of the samples. Thus, we can proceed with one way ANOVA (μ1 = μ2 = μ3).
% The same matrix X will be used as input for anova1().

[p, table, stats] = anova1(X);

% p = 0.07 > 0.05, the null hypothesis cannot be rejected.

% Further comparison of the sample means
compare_means = multcompare(stats);

VariableNames = ["Group A","Group B","Lower Limit","A-B","Upper Limit","P-value"];
tbl2 = array2table(compare_means,"VariableNames");