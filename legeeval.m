function vals = legeeval(n,as,xs)  %Selna,Weston 998429476, MAT128A programming project 2
p_n0 = @(x) x.^0;
p_n1 = @(x) x;
tot = 0;
vals = zeros(length(xs));
as_mark = 1;

for k = 1:1:length(xs)
        for i = 0:1:n
                if (i == 0)
                        tot = tot + as(as_mark)*feval(p_n0,xs(k));
                        as_mark = as_mark + 1;
                elseif (i == 1)
                        tot = tot + as(as_mark)*feval(p_n1,xs(k));
                        as_mark = as_mark + 1;
                else
                        fun1 = @(x) ((2*(i-1)+1).*x.*p_n1(x))-((i-1).*p_n0(x));
                        swap = @(x) (fun1(x))./(i);
                        p_n0 = p_n1;
                        p_n1 = swap;
                        tot = tot + as(as_mark)*feval(p_n1,xs(k));
                        as_mark = as_mark + 1;
                end
        end
        vals(1,k) = tot;
        tot = 0;
        p_n1 = @(x) x;
        p_n0 = @(x) x.^0;
        as_mark = 1;
end
vals = vals(1,:);