format compact
%zad1-----------------------------------------------
opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [-1 3 -2 8 -10];

A = [3 -1 2 -4 5
     -2 4 0 -5 8
     -4 3 8 20 2];

b = [7 12 7];

lb = [];%[-10 -5 -30 -8 -20];

[x, fval, exitflag, output, lambda] = linprog(-f, A, b, [],[],lb, [], [], opcje )

[x, fval] = simplex(f, A, b)