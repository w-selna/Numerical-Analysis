function[val der] = legeder(n,x) % Weston Selna, 998429476
p_n0 = @(x) x.^0;
p_n1 = @(x) x;

for i = 2:1:n
        fun1 = @(x) ((2*(i-1)+1).*x.*p_n1(x))-((i-1).*p_n0(x));
        swap = @(x) (fun1(x))./(i);
        p_n0 = p_n1;
        p_n1 = swap;
end

der_fcn = @(x) ((n.*x.*feval(p_n1,x))-(n.*feval(p_n0,x)))./((x.^2)-1);

val = feval(p_n1,x);
der = feval(der_fcn,x);