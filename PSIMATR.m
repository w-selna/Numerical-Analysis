function M = PSIMATR(n,f)%f is just the 2x2 matrix given in the problem, not a fundamental matrix, not of functions, that comes in lines 13 and 14
nr = 2*n;
xs = cos(pi/(n-1) * (0:(n-1))); % for evaluating functions if i have too, but i dont see how.
xs = fliplr(xs);
M = zeros(nr,nr);
f11 = zeros(1,n);
f12 = zeros(1,n);
f21 = zeros(1,n);
f22 = zeros(1,n);
[v,d] = eigs(f);
v_inv = v^-1;
for i=1:n
	exDt = exp(d*xs(i));
	exAt = v*exDt*v_inv;  			% makes the fundamental matrix evaluated at t. 
	f11(1,i) = exAt(1,1);			% builds vectors holding appropriate portions of the fundamental matrix
	f12(1,i) = exAt(1,2);
	f21(1,i) = exAt(2,1);
	f22(1,i) = exAt(2,2);
end
di = [f11,f22];
ud = f12;
ld = f21;
m1 = diag(di);		% a 2n X 2n matirx
m2 = diag(ud,n);	% a 2n X 2n matirx
m3 = diag(ld,-n);	% a 2n X 2n matirx
M = m1+m2+m3;		% a 2n X 2n matirx
end