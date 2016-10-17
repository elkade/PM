format compact
clear
clc

opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [2 -3];

A = [1 -2
    6 5
    3 -1
    1 3];

b = [2 15 5 6];

lb = [0 -inf];
ub = [inf 0];

[x, fval, exitflag, output, lambda] = linprog(-f, A, b, [],[],lb, ub, [], opcje )
%exitflag powinno byæ 1 je¿eli zakoñczone powodzeniem

