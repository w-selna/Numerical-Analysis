function V = chebs(n,ts)
%
%  Given the row vector ts of length m containing real numbers in the range [0,1],
%  return the (n,m) matrix V whose (i,j) element is the value of
%  the Chebyshev polynomial of degree i-1 at the point ts(j).
%

m = length(ts);
V = zeros(n,m);

V(1,:) = ones(1,m);
V(2,:) = ts;

for i=3:n+1
V(i,:) = 2*ts.*V(i-1,:) - V(i-2,:);
end 


end
