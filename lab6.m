x0 = (rand(3) * 20 - 10);
x0=x0(1,:);
options = optimset('GradObj', 'on', 'Display','iter');
%[x, fval] = fminunc(@fun, x0, options)
options = optimset('Display', 'iter');
%[x, fval] = fminsearch(@fun, x0, options)
x0
[x, fval, it] = DFP(@fun, x0, 1e-4)
