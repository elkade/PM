x0 = [3, -1, -1];
e=1e-4;
[val, grad, hes] = fun(x0);

d0 = -grad;
a0 = 0;

[a1, a2, a3] = alfa_max(@(alfa)fun(x0+alfa*d0), a0, e );

a_max = a3;

fplot(@(alfa)fun(x0+alfa*d0), [a1, a3]);

options = optimset('Display','iter');
fminbnd(@(alfa)fun(x0+alfa*d0), a1, a3, options)

%[alfa1,n_iter] = parabola(@(alfa)fun(x0+alfa*d0), [a1, a2, a3], e);

alfaN = Newton(@(alfa)fun(x0+alfa*d0), a0, d0, e);