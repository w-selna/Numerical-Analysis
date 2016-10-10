function [in,two,ns] = laplacesol(l,e)
% l: The function we want to get the laplace of.  A function of x and y.
% e: The exact solution to compare to. A function of x and y.
ns = [5:10:55];
in = [];
two = [];
for n = 5:10:55			% iterat for many n's
	n2 = double(n+1);   % add 1 so we get a total of n interior points, excluding the boundaries.
	h = double(1/n2);
	xso = [h:h:(1-h)]';					% x's
	yso = [h:h:(1-h)]';					%  y's
	xs = kron(ones(n,1),xso);			% order the grid for x's
	ys = kron(yso,ones(n,1));			% order the grid for y's
	exact = zeros(n^2,1);				% placeholder vector, turn to matrix later
	um = zeros(n^2,1);
	ext	= e(xs,ys); 					% solve for exact solution
	ext
	u = l(xs,ys); 						% solve underlying function
	u
	a = Amatrix(n)*(1/(h^2));
	sol = a\u;				% get laplacian as a vector
	
	solm = reshape(sol,[n,n]);				%convert to matrix form
	exactm = reshape(ext,[n,n]);
	
	in = [in,norm(solm-exactm, 'inf')];		% get matrix norms
	two = [two,norm(solm-exactm)];
end
end