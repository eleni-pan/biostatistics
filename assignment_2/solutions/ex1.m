%Insert the data

X = [38 32 30 40 45 36; 37 35 40 39 42 46; 36 39 43 39 48 47]';

%Our reps are 3
%Use two way ANOVA (anova2(data, reps))

[p,table, stats] = anova2(X, 3);