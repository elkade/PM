x0 = [1;-1;2]
[val gradient] = fun(x0)
d0 = -gradient
[a1, a2, a3] = przedzial_niepewnosci(@(alfa)fun(x0+alfa*d0), 0, 0.0000001)
fplot(@(alfa)fun(x0+alfa*d0), [a1, a3]);

fminbnd(@(alfa)fun(x0+alfa*d0), a1, a3)