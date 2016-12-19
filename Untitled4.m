format compact
%zad1-----------------------------------------------
opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [5 -3 2 -2 7];

A = [-6 -6 3 -2 -5
    -3 0 -5 0 6
    4 4 0 1 2];

b = [-5 1 -6];
%[x, fval, exitflag, output, lambda] = linprog(-f, A, b, [],[],[0,0,0,0,0], [], [], opcje )
[x, fval, exitcode] = sympleks1(f, A, b)