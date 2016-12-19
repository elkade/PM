function [x,fval,it]=DFP(fun,x0,e)
    it = 0;
    xk = x0';

    [val, grad] = fun(xk);
    grad = grad';
    Hk = eye(length(x0));
    while (abs(grad) > e)


        [a1, a2, a3] = alfa_max(@(alfa)fun(xk+alfa*(-grad)), 0, 1);
        %ak = parabola(@(alfa)fun((xk+alfa*(-grad))'), [a1, a2, a3], 1e-4);
        ak = Newton(@(alfa)fun((xk+alfa*(-grad))'), 0, -grad', 1e-4);
        xk1 = xk + ak * -grad;

        sk = xk1-xk;
        xk = xk1;

        [val, grad1] = fun(xk1);

        grad1 = grad1';
        
        rk = grad1 - grad;
        grad = grad1;
        
        Hk = Hk + (sk*sk')/(sk'*rk) - (Hk*rk*rk'*Hk')/(rk'*Hk*rk);
        it = it+1;  
        it
        xk
        fun(xk)
    end
    x = xk;
    fval = fun(xk);
end