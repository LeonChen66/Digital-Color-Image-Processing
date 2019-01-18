img = double(imread('4.jpg'));
img_new = zeros(533,800,3);
for i = 1:533
    for j = 1:800
        mother = abs(img(i,j,1)-img(i,j,2))+abs(img(i,j,2)-img(i,j,3))+abs(img(i,j,1)-img(i,j,3));             %¤À¥À
        l1 = abs(img(i,j,1)-img(i,j,2))/mother;
        l2 = abs(img(i,j,1)-img(i,j,3))/mother;
        l3 = abs(img(i,j,2)-img(i,j,3))/mother;        
        img_new(i,j,1) = l1;
        img_new(i,j,2) = l2;
        img_new(i,j,3) = l3;
    end
end
figure;
imshow(img_new);