img = double(imread('4.jpg'));
img_new = zeros(533,800,3);
for i = 1:533
    for j = 1:800
        c1 = atan(img(i,j,1)/max(img(i,j,2:3)));
        a = img(i,j,1);
        b = img(i,j,3);
        c2 = atan(img(i,j,2)/max(a,b));
        c3 = atan(img(i,j,3)/max(img(i,j,1:2)));
        img_new(i,j,1) = c1;
        img_new(i,j,2) = c2;
        img_new(i,j,3) = c3;
    end
end

imshow(img_new);