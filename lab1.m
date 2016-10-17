%2016-10-17
format compact
%zad1-----------------------------------------------
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

x_opt = [A(1,:);A(3,:)]\[b(1);b(3)]

f_opt = f*x_opt
%zad2-----------------------------------------------
clear
clc
%linprog przyjmuje nierównoœci mniejsze równe

opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [5 2 3 5];

A = [-1 1 -7 -3
    2 3 1 -4];

Aeq = [1 2 2 1];
beq = 9;

b = [-4 5];

lb = [0 0 0 0];
ub = [];

[x, fval, exitflag, output, lambda] = linprog(f, A, b, Aeq, beq,lb, ub, [], opcje )
%zad3_ciêce_desek----------------------------------------
%deski 2m
%N = 7 pó³ek
%30cm x 80cm
%ile desek potrzeba na wykonanie?
%najmniejsza liczba

%trzeba ustaliæ sposób ciêcia - np najpierw krótkie, potem d³ugie czy
%odwrotnie
%ustalamy macierz ograniczeñ wynikaj¹c¹ ze sposobu ciêcia

%   s1  s2  s3
%80 2   1   x   3*N % ten x to chyba 0
%30 1   4   6   2*N
%   10  0   20

%Xi - liczba desek pociêtych sposobem Si

%szukamy minimum min(x1+x2+x3)
%2x1+x2>=3*N
%x1+4x2+6x3>=2*N
%x>=0

opcje = optimset('linprog');
opcje = optimset(opcje, 'Display', 'iter', 'LargeScale', 'off', 'Simplex', 'on');

f = [1 1 1];

A = [-2 -1 0
    -1 -4 -6];

b = [-21 -14];

Aeq = [];
beq = [];

lb = [0 0 0 0];
ub = [];

[x, fval, exitflag, output, lambda] = linprog(f, A, b, Aeq, beq,lb, ub, [], opcje )