x0 = [3, -1, -1];
options = optimset('GradObj', 'on', 'Display','iter');
[x, fval] = fminunc(@fun, x0, options)
options = optimset('Display','iter');
[x, fval] = fminsearch(@fun, x0, options)