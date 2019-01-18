img=imread('imgsample.jpg');
imhist(img);
title('histogram of gray leve')
xlabel('Gray level')
ylabel('Numbers of pixel')
axis([0 260 0 20000]);
img_new =uint8(ones(600,800));
figure;
for i=1:600
    for j=1:800
        if img(i,j)==uint8(3)
            img_new(i,j)=img(i,j);
        elseif img(i,j)==uint8(2)
            img_new(i,j)=img(i,j);
        elseif img(i,j)==uint8(1)
            img_new(i,j)=img(i,j);
        elseif img(i,j)==uint8(0)
            img_new(i,j)=img(i,j);
        elseif img(i,j)==uint8(4)
            img_new(i,j)=img(i,j);
        elseif img(i,j)==uint8(5)
            img_new(i,j)=img(i,j);
        else
            img_new(i,j)=uint8(255);
        end
    end
end

imshow(uint8(img_new))