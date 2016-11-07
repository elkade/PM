format compact

f = [1 1 1];

A = [2 1
    3 3
    1.5 0];

b = [10 24 6];

A = [2 3 -2
    -1 0 1]
b = [7 1]

[x, fval] = simplex(f, A, b)

%[x, fval, exitflag, output, lambda] = linprog(-f, A, b, [],[],[], [], [], [] )