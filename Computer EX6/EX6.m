%first picture
start_1 = zeros(128,128,3);
for i =1:128
    for j =1:128
        for k =1:3
            if k == 2
                start_1(i,j,k) = 255;
            else
                start_1(i,j,k) = 0;
            end
        end
    end 
end

for i=32:96
    for j = 32:96
        for k =1:3
            if k ==1
               start_1(i,j,k) = 255;
            elseif k==2
                start_1(i,j,k) = 0;
            else
                start_1(i,j,k) = 255;
            end
        end
    end
end
imshow(uint8(start_1))

%first picture
start_2 = zeros(128,128,3);
for i =1:128
    for j =1:128
        for k =1:3
            if k == 2
                start_2(i,j,k) = 255;
            else
                start_2(i,j,k) = 0;
            end
        end
    end 
end

for i=32:96
    for j = 32:96
        for k =1:3
            if k ==1
               start_2(i,j,k) = 200;
            elseif k==2
                start_2(i,j,k) = 50;
            else
                start_2(i,j,k) = 200;
            end
        end
    end
end
figure;
imshow(uint8(start_2))

%first picture
start_3 = zeros(128,128,3);
for i =1:128
    for j =1:128
        for k =1:3
            if k == 2
                start_3(i,j,k) = 255;
            else
                start_3(i,j,k) = 0;
            end
        end
    end 
end

for i=32:96
    for j = 32:96
        for k =1:3
            if k ==1
               start_3(i,j,k) = 150;
            elseif k==2
                start_3(i,j,k) = 100;
            else
                start_3(i,j,k) = 150;
            end
        end
    end
end
figure;
imshow(uint8(start_3))

%first picture
start_4 = zeros(128,128,3);
for i =1:128
    for j =1:128
        for k =1:3
            if k == 2
                start_4(i,j,k) = 255;
            else
                start_4(i,j,k) = 0;
            end
        end
    end 
end

for i=32:96
    for j = 32:96
        for k =1:3
            if k ==1
               start_4(i,j,k) = 100;
            elseif k==2
                start_4(i,j,k) = 150;
            else
                start_4(i,j,k) = 100;
            end
        end
    end
end
figure;
imshow(uint8(start_4))

start_5 = zeros(128,128,3);
for i =1:128
    for j =1:128
        for k =1:3
            if k == 2
                start_5(i,j,k) = 255;
            else
                start_5(i,j,k) = 0;
            end
        end
    end 
end

for i=32:96
    for j = 32:96
        for k =1:3
            if k ==1
               start_5(i,j,k) = 50;
            elseif k==2
                start_5(i,j,k) = 200;
            else
                start_5(i,j,k) = 50;
            end
        end
    end
end
figure;
imshow(uint8(start_5))
final_pic = [uint8(start_5) uint8(start_4) uint8(start_3) uint8(start_2) uint8(start_1)]
figure
imshow(final_pic)