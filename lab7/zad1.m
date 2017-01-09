n = 10;
m = 5;

D = double(int8(rand(n,n) * 20 - 10))
c = double(int8(rand(n,1) * 20 - 10))
A = double(int8(rand(m,n) * 20 - 10))
b = double(int8(rand(m,1) * 9 + 1))

%lb = zeros(n,1);

options = optimset('quadprog');
options = optimset(options, 'Display', 'iter', 'LargeScale', 'off', 'Algorithm', 'active-set');


D = D * D'

x0 = [0,0,0,0,0,0,0,0,0,0]'
[x,fval,exitflag,output,lambda] = quadprog(D,c,A,b,[],[],[],[],[],options)
lambda.ineqlin;

Ak=zeros(1,n);
x = x0;
e = 1e-06;

for k = 1:10
    grad = D*x + c;
    buf = [D A';A zeros(m)] \ [-grad;zeros(m,1)];
    d = buf(1:n)';
    lambda = buf(n+1:n+m);
    if d == zeros(1,n)
        mm = 1000;
        j = 0;
        for i = 1:m
            if Ak(i) == 1
                if mm Ak(i) < mm
                    mm = Ak(j);
                    j = i;
                end
            end
        end
        if mm > 0
            break
        end
        if j > 0
            Ak(j) = 0;
        end
        continue
    else
        mm = 1000;
        j = 0;
        for i=1:m
            if Ak(i) == 0 && A(i,:)*d'>0
                cur = (b(i) - A(i,:)*x)/(A(i,:)*d');
                if cur < mm
                    mm = cur;
                    j = i;
                end
            end
        end
        alpha = min(1,mm);
        x = x + alpha * d';
        if j > 0
            Ak(j) = 1;
        end
    end
    if norm(d)<e
        break
    end
end
k
x