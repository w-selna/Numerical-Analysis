function X = sor_general(omega, A, row, col, center, B, X0, maxi)
    N = length(B);
    M = length(A);
    
    X = X0';
    
    for i = 1 : maxi
       for j = 1 : N
          sigma = 0;
          for k = center(j) - 2 : center(j) + 2
              if k >= 1 && k <= M
                  if row(k) == j && col(k) ~= j
                      sigma = sigma + A(k) * X(col(k));
                  end
              end
          end
          X(j) = (1 - omega) * X0(j) + omega * (B(j) - sigma) / A(center(j));
       end
       
       X0 = X';
    end

    X = X';
end