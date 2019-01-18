img=double(imread('lena.bmp'));

mask_1 = [0 -1 0;-1 4 -1;0 -1 0];
mask_2 = [-1 -1 -1;-1 8 -1;-1 -1 -1];
mask_3 = [1 -2 1;-2 4 -2;1 -2 1];
mask_4 = [0 -1 0;-1 5 -1;0 -1 0];
mask_5 = 1/25*ones(5,5);
mask_6 = [-1 0 1;-2 0 -2;-1 0 -1];
image_edge1=conv2(mask_1,img);
figure;
imshow(image_edge1);

image_edge2=conv2(mask_2,img);
figure;
imshow(image_edge2);

image_edge3=conv2(mask_3,img);
figure;
imshow(image_edge3);

image_edge4=conv2(mask_4,img);
figure;
imshow(image_edge4);

image_edge5=conv2(mask_5,img);   %blur 
figure;
imshow(image_edge5);


