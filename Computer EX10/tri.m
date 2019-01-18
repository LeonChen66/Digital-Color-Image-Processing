%Tri
I = double(imread('lena.bmp'));
[x,y] = size(I);
I_new = sort(reshape(I,x*y,1));
n = x*y;
m0 = 1;
m1 = 0;
m2 = 0;
m3 = 0;
m4 = 0;
m5 = 0;
for i = 1:x
    for j = 1:y
        m1 = I (i,j) + m1;
    end
end
m1 = m1/n;

for i = 1:x
    for j = 1:y
        m2 = I (i,j)^2 + m2;
    end
end
m2 = m2/n;

for i = 1:x
    for j = 1:y
        m3 = I (i,j)^3 + m3;
    end
end
m3 = m3/n;

for i = 1:x
    for j = 1:y
        m4 = I (i,j)^4 + m4;
    end
end
m4 = m4/n;
for i = 1:x
    for j = 1:y
        m5 = I (i,j)^5 + m5;
    end
end

m5 = m5/n;
clear i;
cd = det([m0 m1 m2;m1 m2 m3;m2 m3 m4]);
c0 = (1/cd)*det([-m3 m1 m2;-m4 m2 m3;-m5 m3 m4]);
c1 = (1/cd)*det([m0 -m3 m2;m1 -m4 m3;m2 -m5 m4]);
c2 = (1/cd)*det([m0 m1 -m3;m1 m2 -m4;m2 m3 -m5]);
A = ((c0/2-c1*c2/6+c2^3/27)-((c0/2-c1*c2/6+c2^3/27)^2+(c1/3-c2^2/9)^3)^0.5)^(1/3);
B = -(c1/3-c2^2/9)/A;
W1 = -0.5 + i*(sqrt(3)/2);
W2 = -0.5-i*(sqrt(3)/2);
z0 = -c2/3-A-B;
z1 = -c2/3-W1*A-W2*B;
z2 = -c2/3-W2*A-W1*B;
pd = det([1 1 1;z0 z1 z2;z0^2 z1^2 z2^2]);
p0= (1/pd)*det([m0 1 1;m1 z1 z2;m2 z1^2 z2^2]);
p1 = (1/pd)*det([1 m0 1;z0 m1 z2;z0^2 m2 z2^2]);
p2 = 1-p0-p1;
t1=I_new(round((n*(p0)))+1)-1;
t2=I_new(round((n*(p0+p1)))+1)-1;

for i = 1:x
    for j = 1:y
        if I(i,j)<=t1
            I(i,j)= round(z0);
        elseif I(i,j)<=t2 & I(i,j)>t1
            I(i,j) = round(z1);
        else
            I(i,j) = round(z2);
        end
    end
end
imshow(uint8(I));
figure;
imhist(uint8(I))
axis([0 255 0 200000])