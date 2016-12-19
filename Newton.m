function alfaN = Newton(F, a0, d0, e)
F1 = 1;
F2 = 1;    
k = 1;
    ak = a0;
    d = d0;
    while abs(F1/F2) > e
        %fprintf('iteracja: %d\n', k);
        [val, grad, hes] = F(ak);
        F1 = grad * d';
        F2 = d * hes * d';
        ak = ak-F1/F2;
        k = k+1;
        %fprintf('alpha: %d\n', ak);
        %fprintf('val: %d\n\n', val);
    end
    alfaN = ak;    
end