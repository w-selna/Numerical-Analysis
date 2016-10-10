function X = jacobi_full(A, row, col, center, B, X0, delta, maxi)
    % get the length of sparse matrix and the number of variables
    N = length(B);
    M = length(A);
    
    % iterate for calculating by jacobi method
    for i = 1 : maxi
        % one step of calculating
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
       
       % estimate the error between current value and previous value
		err = abs(norm(X' - X0));
		if err < delta
			break
		end
       
		X0 = X';
    end

    % return the result
    X = X';
end