function as = legecoefs(n,fun)    %Selna,Weston:MAT128A programming project 2
p_n0 = @(x) x.^0;
p_n1 = @(x) x;
arrplace = 1;

for i = 0:1:n
        if (i == 0)
                newfun0 = @(x) fun(x).*p_n0(x);
                as(1,arrplace) = (i+.5)*integral(newfun0,-1,1);
                arrplace = arrplace + 1;
        elseif (i == 1)
                newfun1 = @(x) fun(x).*p_n1(x);
                as(1,arrplace) = (i+.5)*integral(newfun1,-1,1);
                arrplace = arrplace + 1;
        else
                fun1 = @(x) ((2*(i-1)+1).*x.*p_n1(x))-((i-1).*p_n0(x))
                swap = @(x) (fun1(x))./(i);
                p_n0 = p_n1;
                p_n1 = swap;
                newfunn = @(x) fun(x).*p_n1(x);
                as(1,arrplace) = (i+.5)*integral(newfunn,-1,1);
                arrplace = arrplace + 1;
        end
end