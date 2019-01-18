img = double(imread('lena.jpg'));
warp = zeros(256,256,3);
for i = 1:256
    for j = 1:256
        r = sqrt((i-128)^2+(j-128)^2);
        theta = r/2*pi/180;
        x = round((i-128)*cos(theta)-(j-128)*sin(theta)+128);
        y = round((i-128)*sin(theta)+(j-128)*cos(theta)+128);
        if 1<x && x<512
            if 1<y && y<512
        warp(x,y,1)=img(i,j,1);
        warp(x,y,2)=img(i,j,2);
        warp(x,y,3)=img(i,j,3);
            end
        end
    end
end
