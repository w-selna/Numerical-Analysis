function H = hilbert(n)
format long;
J = 1:n;
J = J(ones(n,1),:);
I = J';
E = single(ones(n,n));
H = E./(I+J-1);