function [ a1, a2, a3 ] = alfa_max( F, a0, d )
    a1 = a0;
    a = a1 + d;
    if (F(a1) <= F(a))
        a3 = a;
        a2 = (a1 + a3) / 2;
        while (cond(F, a1, a2 , a3) ~= 1)
            a2 = (a1 + a2) / 2;
        end
    else
        a2 = a;
        a3 = a2 + d;
        while (cond(F, a1, a2 , a3) ~= 1)
            d = 2 * d;
            a3 = a2 + d;
        end
    end
end

function res = cond(F, a1, a2, a3)
    assert(a1 ~= a2)
    assert(a3 ~= a2)
    res = (a1 < a2 && a2 < a3 && F(a1) > F(a2) && F(a3) > F(a2));
end