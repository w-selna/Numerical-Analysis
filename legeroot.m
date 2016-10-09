function root = legeroot(n,z0) % Weston Selna, 998429476
diff = 1;
z_hold = z0;
while (diff > 10^-13)
        [num den] = legeder(n,z_hold);
        z1 = z_hold - (num/den);
        diff = abs(z1-z_hold);
        z_hold = z1;
end
root = z_hold;