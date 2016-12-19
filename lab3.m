%2016-10-17
format compact
%zad1-----------------------------------------------
opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [-4 1 -2];

A = [-3 1 -7
    1 -2 4
    -2 1 5];

b = [-10 5 2];

lb = [-inf -inf -inf];
ub = [5 10 30];

[x, fval, exitflag, output, lambda] = linprog(f, -A, -b, [],[],lb, ub, [], opcje )
%exitflag powinno byæ 1 je¿eli zakoñczone powodzeniem



% zadanie dualne

f_buf = f;

f = [b -ub]

A = [A' eye(3)]

%A=[A -A]'
%A = [A eye(size(A,1))]

b = f_buf%[f_buf -f_buf]

ub = [inf, inf, inf, inf, inf, inf]

lb = [0,0,0,0,0,0]

[x, fval, exitflag] = sympleks2(f,A,b)

%[x, fval, exitflag, output, lambda] = linprog(-f,[],[], A, b, lb, ub, [], opcje )
