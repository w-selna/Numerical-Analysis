function [xs,whts] = clenshaw(n) %Weston Selna, MAT128A, Programming project 3
xs = zeros(n+1,1)';
whts = zeros(n+1,1)';
cosx = @(x) cos(x);
for j = 0:1:n
        top = 2*j+1;
        bot = 2*n+1;
        node = pi*(top/bot);
        x_j = feval(cosx,node);
        xs(j+1) = x_j;
        w_j = 0;
        if (j < n)
                for k = 1:1:floor(n/2)
                        w_j = w_j + (1/(1-(4*(k^2))))*feval(cosx,2*k*node);
                end
                w_j = w_j + .5;
                w_j = w_j*(8/((2*n)+1));
                whts(j+1) = w_j;
        else
                for k = 1:1:floor(n/2)
                        w_j = w_j + (1/(1-(4*(k^2))));
                end
                w_j = w_j + .5;
                w_j = w_j*(4/((2*n)+1));
                whts(j+1) = w_j;
        end
        w_j = 0;
        x_j = 0;
end



