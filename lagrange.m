function val = lagrange(xs,ys,x)   % Selna, Weston   programming project 1
val = 0;
go = 0;
for k = 1:1:length(xs)
        for i = 1:1:length(xs)
                if ~(i==k);
                        if (go == 0);
                                num = 1;
                                denom = 1;
                                num = num*(x-xs(1,i));
                                denom = denom*(xs(1,k)-xs(1,i));
                                go = 1;
                        else
                                num = num*(x-xs(1,i));
                                denom = denom*(xs(1,k)-xs(1,i));
                        end
                else
                        ;
                end
        end
        val = val + (ys(1,k)*(num/denom));
        go = 0;
end
