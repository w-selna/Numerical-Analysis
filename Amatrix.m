function A = Amatrix(n)
zero1 = zeros(1,n);
zero1(1,1) = -2;
zero1(1,2) = 1;
top = toeplitz(zero1);
A = kron(top,eye(n))+kron(eye(n),top)