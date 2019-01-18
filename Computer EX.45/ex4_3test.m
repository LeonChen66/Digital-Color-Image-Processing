img = double(imread('4.jpg'));
img_new = zeros(533,800,3);
for i = 1:533
    for j = 1:800
        mother = (abs(img(i,j,1)-img(i,j,2)))^2+(abs(img(i,j,2)-img(i,j,3)))^2+(abs(img(i,j,1)-img(i,j,3)))^2;             %¤À¥À
        l1 = (abs(img(i,j,1)-img(i,j,2)))^2/mother;
        l2 = (abs(img(i,j,1)-img(i,j,3)))^2/mother;
        l3 = (abs(img(i,j,2)-img(i,j,3)))^2/mother;        
        img_new(i,j,1) = l1;
        img_new(i,j,2) = l2;
        img_new(i,j,3) = l3;
    end
end

imshow(img_new);