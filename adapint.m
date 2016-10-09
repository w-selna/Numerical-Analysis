function val = adapint(toler,n,f,a,b) %Weston Selna, MAT128A, Programming project 3
val = 0;
whole = oneint(n,f,a,b);
subdivided = oneint(n,f,a,(a+b)/2) + oneint(n,f,(a+b)/2,b);
diff = abs(whole - subdivided);
if (diff > toler)
        val = adapint(toler,n,f,a,(a+b)/2);
        val = val + adapint(toler,n,f,(a+b)/2,b);
else
        val = whole;
end