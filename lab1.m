%2016-10-17
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

%trzeba wiedzieæ, jak rozwi¹zaæ przyk³ad linprogiem
%znaæ algorytm z dzisiejszego wyk³adu

hold on%¿eby efekty graficzne siê nie kasowa³y
grid on
x1 = -2 : 0.1 : 2;
x2 = x1;
axis([-2, 2, -2, 2]);%zakresy osi
[X1, X2] = meshgrid(x1, x2);
F = f(1).*X1 + f(2).*X2;
[C, h] = contour(X1, X2, F, 'r-');%rysuje poziomice, red ci¹g³a

clabel(C, h)%etykietuje poziomice

for i=1:4
   G = A(i,1).*X1+A(i,2).*X2-b(i);
   contour(X1,X2,G,0:-0.1:-0.5,'g-');
   contour(X1,X2,G,[0,0],'b-');
   %gtext(sprintf('g%d', i));
end

x_opt = [A(i,:);A(3,:)]\[b(1);b(3)]

f_opt = f'*x_opt