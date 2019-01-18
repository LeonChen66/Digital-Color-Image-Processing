%Bilevel
I = double(imread('lena.bmp'));
[x,y] = size(I);
I_new = sort(reshape(I,x*y,1));
n = x*y;
m0 = 1;
m1 = 0;
m2 = 0;
m3 = 0;
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
cd = det([m0 m1;m1 m2]);
c0 = (1/cd)*det([-m2 m1;-m3 m2]);
c1 = (1/cd)*det([m0 -m2;m1 -m3]);
z0 = 0.5*(-c1-sqrt(c1^2-4*c0));
z1 = 0.5*(-c1+sqrt(c1^2-4*c0));
pd = det([1 1;z0 z1]);
p0 = (1/pd)*det([1 1;m1 z1]);
p1 = 1-p0;
t1=I_new(round((n*(p0)))+1)-1;

for i = 1:x
    for j = 1:y
        if I(i,j)<=t1
            I(i,j)= round(z0);
        else
            I(i,j) = round(z1);
        end
    end
end
imshow(uint8(I));
figure;
imhist(uint8(I))
axis([0 255 0 400000])