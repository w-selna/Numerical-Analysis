function val = oneint(n,f,a,b) %Weston Selna, MAT128A, Programming project 3
val = 0;
[xs whts] = clenshaw(n);
for k = 0:1:n
        x = (xs(k+1)*(b-a)/2) + ((b+a)/2);
        val = val + feval(f, x)*whts(k+1);
end
val = val*((b-a)/2);