function X = gauss_seidel_one(A, row, col, center, B, X0)
    N = length(B);
    M = length(A);

    X = X0';

    for j = 1 : N
      sigma = 0;
      for k = center(j) - 2 : center(j) + 2
          if k >= 1 && k <= M
              if row(k) == j && col(k) ~= j
                  sigma = sigma + A(k) * X(col(k));
              end
          end
      end
      X(j) = (B(j) - sigma) / A(center(j));
    end
    
    X = X';
end