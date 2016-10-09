function [xs whts] = legequad(n) % Weston Selna, 998429476
xs = zeros(n,1);
whts = zeros(n,1);

for i = 1:n
        z0 = cos((pi*i)/(n+1));
        xs(i,1) = legeroot(n,z0);
end

for k = 1:n
        [val p_nprime] = legeder(n,xs(k,1));
        whts(k,1) = 2/((1-(xs(k,1))^2)*(p_nprime)^2);
end