I = [10 8 10 9 20 21 32 30 40 41 41 40;12 10 11 10 19 20 30 28 38 40 40 39;10 9 10 8 20 21 30 29 42 40 40 39;11 10 9 11 19 21 31 30 40 42 38 40];
for i = 1:4
    for j = 1:12
        if I(i,j)<=11
            I(i,j)= 10;
        elseif I(i,j)<=27 & I(i,j)>11
            I(i,j) = 19;
        elseif I(i,j)<=37 & I(i,j)>27
            I(i,j) = 31
        else
            I(i,j) = 40
        end
    end
end