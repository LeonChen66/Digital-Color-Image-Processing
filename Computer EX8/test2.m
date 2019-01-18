img = double(imread('lena512color.tiff'));
warp = zeros(512,512,3);
for i = 1:512
    for j = 1:512
        r = sqrt((i-256)^2+(j-256)^2);
        theta = r/2*pi/180;
        rot = [cos(theta) sin(theta);-sin(theta) cos(theta)];
        mat = [i-256;j-256];
        mat_A = rot * mat;
        
        x = round(mat_A(1)+256);
        y = round(mat_A(2)+256);
        if 1<x && x<512
            if 1<y && y<512
        warp(i,j,1)=img(x,y,1);
        warp(i,j,2)=img(x,y,2);
        warp(i,j,3)=img(x,y,3);
            end
        end
    end
end
