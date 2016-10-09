function vals = legendre(n,xs)%Selna,Weston 998429476, MAT128A programming project 2
p_n0 = @(x) x.^0;
p_n1 = @(x) x;
vals = zeros(length(xs));

for i = 2:1:n
        fun1 = @(x) ((2*(i-1)+1).*x.*p_n1(x))-((i-1).*p_n0(x))
        swap = @(x) (fun1(x))./(i);
        p_n0 = p_n1;
        p_n1 = swap;
end

for k = 1:1:length(xs)
        vals(1,k) = feval(p_n1,xs(k));
end
vals = vals(1,:);
