function X = jacobi_one(A, row, col, center, B, X0)
    N = length(B);
    M = length(A);

    for j = 1 : N
      X(j) = B(j);
      for k = center(j) - 2 : center(j) + 2
          if k >= 1 && k <= M
              if row(k) == j && col(k) ~= j
                  X(j) = X(j) - A(k) * X0(col(k));
              end
          end
      end
      X(j) = X(j) / A(center(j));
    end

    X = X';
end