function X = jacobi(A, row, col, center, B, X0, delta, maxi)
    for i = 1 : maxi
       X1 = jacobi_one(A, row, col, center, B, X0);
       X2 = jacobi_one(A, row, col, center, B, X1);
       X = X2 - (X2 - X1) .^ 2 ./ (X2 - 2 * X1 + X0);
       
       err = abs(norm(X - X0));
	   error(i) = err
       if err < delta
          break
       end
       
       X0 = X;
    end
end