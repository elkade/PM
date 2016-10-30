format compact

f = [340 404];

A = [420 760
    9 5];

b = [5480 61];

[x, fval] = simplex(f, A, b)