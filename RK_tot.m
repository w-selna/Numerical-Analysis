function [x1,z1,hs1,x2,z2,hs2] = RK_tot(f,a,b,t,y,h,e)
hs1 = [];
x1 = [];
z1 = [];

hs2 = [];
x2 = [];
z2 = [];

a = double(a);
b = double(b);
t = double(t);
y = double(y);
h = double(h);
e = double(e);

x1(1) = a;
z1(1) = y;
hs1(1) = h;

x2(1) = a;
z2(1) = y;
hs2(1) = h;

c1 = 1;
while x1(c1)<b
	[t1,v1,h1,e1] = RK(f,x1(c1),z1(c1),hs1(c1),e);
	x1(c1+1) = t1;
	z1(c1+1) = v1;
	hs1(c1+1) = hs1;
	c1 = c1+1;
end

c2 = 1
while x2(c2)<b
	[t2,v2,h2,e2] = RKF(f,x2(c2),z2(c2),h2(c2),e);
	x2(c2+1) = t2;
	z2(c2+1) = v2;
	hs22(c2+1) = hs2;
	c2 = c2+1;
end