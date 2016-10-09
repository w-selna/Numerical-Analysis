function as = divided(xs,ys)  % Selna, Weston   programming project 1
M = zeros(length(xs));
offset = 1;
M(1,:) = ys;
for r = 2:1:length(xs)
        for c = 1:1:length(xs)-offset
                M(r,c) = (M(r-1,c+1)-M(r-1,c))/(xs(1,c+offset)-xs(1,c));
        end
        offset = offset + 1;
end
as = M(:,1)';