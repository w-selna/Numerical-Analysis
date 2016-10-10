function [t(1,2),vals4(:,2),h,e] = RKF(f,t,y,h,e) 
pass = 0
t = [t,t+h];			% the times for approximation the function at for 1 steps of h
vals4 = zeros(length(f),2);	%4th order
vals5 = zeros(length(f),2);	%5th order
vals4(,1) = y;  		% initalize the first column of the vals arrays
while pass == 0
	n = 1								% f as a vector of equations  y' = f(t,y)
	h = double(h)
	t = double(t)
	y = double(y)
	e = double(e)
	 				
	for i = 1:length(f)
		%build k's
		k1 = h*f(i)(t(1),vals4(i,1))
		k2 = h*f(i)(t(1)+(.25*h),vals4(i,1)+(.25*k1))
		k3 = h*f(i)(t(1)+double(3*h/8),vals4(i,1)+(double(3*k1/32))+double(k2*9/32))
		k4 = h*f(i)(t(1)+double(12*h/13),vals4(i,1)+(double(1932*k1/2197))-(double(7200*k2/2197))+(double(7296*k3/2197)))
		k5 = h*f(i)(t(1)+h,vals4(i,1)+(double(439*k1/216))-(double(8*k2))+(double(3680*k3/513))-(double(845*k4/4104)))
		k6 = h*f(i)(t(1)+.5*h),vals4(i,1)-(double(8*k1/27))+(double(2*k2))+(double(3544*k3/2565))+(double(1859*k4/4104))-(double(11*k5/40)))
		r = norm(abs((double(k1/360))-(double(128*k3/4275))-(double(2197*k4/75240))+(double(k5/50))+(double(2*k6/55))))
		if r <= 15*abs(h)*e
			t = t+h
			vals4(i,2) = vals4(i,1)+double((double(25*k1/216))+(double(1408*k3/2565))+(double(2197*k4/4104))-(double(k5/5)))
			h = h*.8*(15*abs(h)*e/norm(abs((double(k1/360))-(double(128*k3/4275))-(double(2197*k4/75240))+(double(k5/50))+(double(2*k6/55)))))
			pass = 1
		else
			h = h*.8*(15*abs(h)*e/norm(abs((double(k1/360))-(double(128*k3/4275))-(double(2197*k4/75240))+(double(k5/50))+(double(2*k6/55)))))
		end
	end
end
end