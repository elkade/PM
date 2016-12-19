function [ val, grad, hes ] = fun(u)

x = u(1);
y = u(2);
z = u(3);

val = x^2 + y^2 + 3*z^4 + 2*x^2*y^2 + x*y + 2*y*z + x + 2*y + 3*z;

grad = [x*(4*y^2+2) + y + 1 4*x^2*y + x + 2*(y+z+1) 2*y + 12*z^3 + 3];

hes = [4*y^2+2 8*x*y+1 0
    8*x*y+1 4*x^2+2 2
    0 2 36*z^2];