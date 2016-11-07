format compact

f = [3  2];

A = [2 1
    3 3
    1.5 0];

b = [10 24 6];

[x, fval] = simplex(f, A, b,[-4,6])