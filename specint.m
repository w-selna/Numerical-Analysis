function [S,xs] = specint(n)

%
%  Return the spectral integration matrix which takes the values of the Chebyshev
%  expansion
%
%            n-1           
%    f(x) = \sum a_j T_j(x)
%            j=0
%
%  at the Chebyshev nodes
%
%     cos ( j pi /(n-1) )    j=n-1,n-2,...,0
%
%  to the values of the function
%
%                 x
%    g(x) = \int     f(t) dt
%                -1
%
%  at the same nodes.
%

S  = [];
xs = [];

%
%  Construct the Chebyshev nodes
%

xs = cos(pi/(n-1) * (0:(n-1)));
xs = fliplr(xs);


%
% Form the matrix U which takes the values of a Chebyshev expansion at the node
% the the expansion coefficients
%

C = chebs(n,xs);

U = C(1:n,:);
U(1,:) = 1/2 * U(1,:);
U(n,:) = 1/2 * U(n,:);
U(:,1) = 1/2 * U(:,1);
U(:,n) = 1/2 * U(:,n);
U =  2/(n-1) * U;

% fprintf('error in U = %d\n',norm(U*C(1:n,:)'-eye(n)))


%
% Form the matrix X
%

C  = C';
xs = xs';


X = zeros(n,n);
X(:,1) = xs;
X(:,2) = xs.**2/2;
for j=3:n
X(:,j) = 1/2 * (C(:,j+1)/j - C(:,j-1)/(j-2));
end 
for i=2:n
X(i,:) = X(i,:) - X(1,:);
end 
X(1,:) = 0;
S = X*U;

end 


