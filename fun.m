function [ val, gradient ] = fun(x)
val = (x(1) - 2*x(3))^4 + 2*(x(1)+x(2))^2 + 5*(x(3)-2*(x(2)))^2;
gradient = [
    -4*((x(1)-2*x(2))^3 + x(1) + x(2));
    4*(x(1)+11*x(2)-5*x(3));
    10*(x(3)-2*x(2)) - 8*(x(1)-2*x(3))^3;    
    ];