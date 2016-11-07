function [x, fval, exitflag] = simplexLb(f, A, b, lb)
l = size(A,2)
A = [A A.*-1]
A'
S = zeros(l, 2*l);
for i=1:l
   S(i,i)=-1;
   S(i,i+l)=1;
end
A = [A' S']'

b = [b -lb]

f = [f f]

[x] = simplex(f, A, b)
end