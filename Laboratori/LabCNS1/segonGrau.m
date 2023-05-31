function [res1, res2] = segonGrau(a, b, c)
    if a == 0
        if b == 0
            res1 = "NTS";
            res2 = "NTS";
        else
            res1 = -c/b;
            res2 = -c/b;
        end
    elseif b == 0
        if a*(-c) < 0
            res1 = "NTS";
            res2 = "NTS";
        else
            res1 = sqrt(-c/a);
            res2 = -sqrt(-c/a);
        end
    elseif c == 0
        res1 = 0;
        res2 = -b/a;
    else
        if (b^2-4*a*c) < 0
            res1 = "NTSR";
            res2 = "NTSR";
        elseif (b^2-4*a*c) == 0
            res1 = -b/2*a;
            res2 = res1;
        else
            res1 = (-b+sqrt(b^2-4*a*c))/2*a;
            res2 = (-b-sqrt(b^2-4*a*c))/2*a;
        end
    end
end