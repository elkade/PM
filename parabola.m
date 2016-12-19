function [alfa1,n_iter] = parabola(F, p, e)

a1 = p(1);
a2 = p(2);
a3 = p(3);

k = 1;
[a1 a2 a3]
while k < 10
    a = aa(@w, F, [a1,a2,a3])
    if abs(a-a2)<e
        n_iter = k;
        alfa1 = a;
        return
    end
    if a1 < a && a2 > a
        a3 = a2;
        a2 = a;
    end
    if a2 < a && a3 > a
        a1 = a2;
        a2 = a;
    end
    
[a1 a2 a3]
F(a)
k = k+1;
end
alfa1 = a;
n_iter = k;
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

function res = aa(w, F, p)

a1 = p(1);
a2 = p(2);
a3 = p(3);

m = (a2^2-a3^2)*w(F, p, a1) + (a3^2-a1^2)*w(F, p, a2) + (a1^2-a2^2)*w(F, p, a3);

n =(a2-a3)*w(F, p, a1) + (a3-a1)*w(F, p, a2) + (a1-a2)*w(F, p, a3);

res = 0.5 * m/n;

end