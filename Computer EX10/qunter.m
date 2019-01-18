%Quanterlevel
I = double(imread('lena.bmp'));
%I = [10 8 10 9 20 21 32 30 40 41 41 40;12 10 11 10 19 20 30 28 38 40 40 39;10 9 10 8 20 21 30 29 42 40 40 39;11 10 9 11 19 21 31 30 40 42 38 40];

[x,y] = size(I);
I_new = sort(reshape(I,x*y,1));
n = x*y;
m0 = 1;
m1 = 0;
m2 = 0;
m3 = 0;
m4 = 0;
m5 = 0;
m6 = 0;
m7 = 0;
for i = 1:x
    for j = 1:y
        m1 = I(i,j) + m1;
    end
end
m1 = m1/n;

for i = 1:x
    for j = 1:y
        m2 = I(i,j)^2 + m2;
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
        m5 = I(i,j)^5 + m5;
    end
end
m5 = m5/n;

for i = 1:x
    for j = 1:y
        m6 = I(i,j)^6 + m6;
    end
end
m6 = m6/n;
for i = 1:x
    for j = 1:y
        m7 = I(i,j)^7 + m7;
    end
end
m7 = m7/n;

cd = det([m0 m1 m2 m3;m1 m2 m3 m4;m2 m3 m4 m5;m3 m4 m5 m6]);
c0 = (1/cd)*det([-m4 m1 m2 m3;-m5 m2 m3 m4;-m6 m3 m4 m5;-m7 m4 m5 m6]);
c1 = (1/cd)*det([m0 -m4 m2 m3;m1 -m5 m3 m4;m2 -m6 m4 m5;m3 -m7 m5 m6]);
c2 = (1/cd)*det([m0 m1 -m4 m3;m1 m2 -m5 m4;m2 m3 -m6 m5;m3 m4 -m7 m6]);
c3 = (1/cd)*det([m0 m1 m2 -m4;m1 m2 m3 -m5;m2 m3 m4 -m6;m3 m4 m5 -m7]);
H = (1/36)*(3*c1*c3-12*c0-c2^2);
G = (1/432)*(72*c0*c2+9*c1*c2*c3-27*c1^2-27*c0*(c3^2)-2*c2^3);
C = (G-sqrt(G^2+H^3))^(1/3);
D = -H/C;
Y = c2/6-C-D;
A = 0.5*sqrt(c3^2-4*c2+8*Y);
B = (c3*Y-c1)/(2*A);

z1 = 0.5*(-(c3/2+A)-((c3/2+A)^2-4*(Y+B))^0.5);
z2 = 0.5*(-(c3/2+A)+((c3/2+A)^2-4*(Y+B))^0.5);
z0 = 0.5*(-(c3/2-A)-((c3/2-A)^2-4*(Y-B))^0.5);
z3 = 0.5*(-(c3/2-A)+((c3/2-A)^2-4*(Y-B))^0.5);
pd = det([1 1 1 1;z0 z1 z2 z3;z0^2 z1^2 z2^2 z3^2;z0^3 z1^3 z2^3 z3^3]);
p0 = (1/pd)*det([1 1 1 1;m1 z1 z2 z3;m2 z1^2 z2^2 z3^2;m3 z1^3 z2^3 z3^3]);
p1 = (1/pd)*det([1 1 1 1;z0 m1 z2 z3;z0^2 m2 z2^2 z3^2;z0^3 m3 z2^3 z3^3]);
p2 = (1/pd)*det([1 1 1 1;z0 z1 m1 z3;z0^2 z1^2 m2 z3^2;z0^3 z1^3 m3 z3^3]);
p3 = 1-p0-p1-p2;
t1=I_new(round((n*(p0)))+1)-1;
t2=I_new(round((n*(p0+p1)))+1)-1;
t3=I_new(round((n*(p0+p1+p2)))+1)-1;
for i = 1:x
    for j = 1:y
        if I(i,j)<=t1
            I(i,j)= round(z0);
        elseif I(i,j)<=t2 & I(i,j)>t1
            I(i,j) = round(z1);
        elseif I(i,j)<=t3 & I(i,j)>t2
            I(i,j) = round(z2);
        else
            I(i,j) = round(z3);
        end
    end
end
imshow(uint8(I));
figure;
imhist(uint8(I))
axis([0 255 0 200000])