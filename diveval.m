function val = diveval(xs,as,x)   % Selna, Weston   programming project 1
deg = 0;
for i = 1:1:length(xs)
        if (i == 1);
                val = as(1,i);
        else
                multi = 1;
                for k = 1:1:deg
                        multi = (multi*(x-xs(1,k)));
                end
                val = val + as(1,i)*multi;
                multi = 1;
        end
        deg = deg + 1;
end