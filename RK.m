function [tret,vret,h,e] = RK(f,t,y,h,e)        % y as a vector of initials
pass = 0;
vals1 = zeros(length(f),2);
vals2 = zeros(length(f),3);
vals1(:,1) = y;                 % initalize the first column of the vals arrays
vals2(:,1) = y;
while (pass == 0)
        n = 1;                                                          % f as a vector of equ$
        h1 = double(h);
        h2 = double(h/2);
        t = double(t);
        t1 = [t,t+h1];                  % the times for approximation the function at for 1 st$
        t2 = [t,t+h2,t+h1];             % the times for approximation the function at for 2 st$
        y = double(y);
        e = double(e);

        for i = 1:length(f)
%               print( "calculate vals1(:,2)");
                k1 = h1*f(t1(1),vals1(i,1));
                k2 = h1*f(t1(1)+h2,vals1(i,1)+double(k1/2));
                k3 = h1*f(t1(1)+h2,vals1(i,1)+double(k2/2));
                k4 = h1*f(t1(2),vals1(i,1)+k3);
                vals1(i,2) = vals1(i,1) + double((k1+(2*k2)+(2*k3)+k4)/6);
        end
        for k = 1:2                                             % for 2 time jumps
                for i = 1:length(f)                     % for all equations
                        k1 = h2*f(t2(k),vals2(i,k));                                          $
                        k2 = h2*f(t2(k)+double(h2/2),vals2(i,k)+double(k1/2));
                        k3 = h2*f(t2(k)+double(h2/2),vals2(i,k)+double(k2/2));
                        k4 = h2*f(t2(k),vals2(i,k)+k3);
                        vals2(i,k+1) = vals1(i,k) + double((k1+(2*k2)+(2*k3)+k4)/6);
                end
        end
        vals1
        vals2
        if norm(abs(vals1(:,2)-vals2(:,3))) <= double(15*abs(h)*e)                            $
                t = t+h1;
                tret = t;
                h = h1*.8*((double(15*abs(h1)*e))/norm(abs(vals1(:,2)-vals2(:,3))))^.25
                pass = 1;
                vret = vals1(:,2);
	else
		h = h*.8*((double(15*abs(h)*e))/norm(abs(vals1-vals2)))^.25
		if h < 10^-3
            h = 10^-3;
            t = t+h;
            tret = t;
            pass = 1;
            vret = vals1(:,2);
		end
	end
end
end