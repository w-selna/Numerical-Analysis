function X = sor_accelerate(omega, A, row, col, center, B, X0, maxi)
    for i = 1 : maxi
       X1 = sor_one(omega, A, row, col, center, B, X0);
       X2 = sor_one(omega, A, row, col, center, B, X1);
       X = X2 - (X2 - X1) .^ 2 ./ (X2 - 2 * X1 + X0);

       X0 = X;
    end
end