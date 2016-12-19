function [alfa1,n_iter] = parabola(F, p, e)

k = 1;

while k < 10


k = k+1;    
end

end

function res = w(F, p, a)

a1 = p(1);
a2 = p(2);
a3 = p(3);

r1 = F(a1)*((a-a2)*(a-a3))/((a1-a2)*(a1-a3));

r2 = F(a2)*((a-a1)*(a-a3))/((a2-a1)*(a2-a3));

r3 = F(a3)*((a-a1)*(a-a2))/((a3-a1)*(a3-a2));

res = r1+r2+r3;

end

function res = aa(F, p)

a1 = p(1);
a2 = p(2);
a3 = p(3);

m = 0.5 * (a2^2-a3^2)*F(a1) + (a3^2-a1^2)*F(a2) + (a1^2-a2^2)*F(a3);

n =(a2-a3)*F(a1) + (a3-a1)*F(a2) + (a1-a2)*F(a3);

res = m/n;

end