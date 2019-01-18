SC=zeros(512,512);
SC(257:512,1:256)=ones(256,256)*100;
SC(1:256,257:512)=ones(256,256)*155;
SC(257:512,257:512)=ones(256,256)*255;
mask = ones(150,150)*175;
SC(53:202,53:202)=mask;
SC(310:459,53:202)=mask;
SC(53:202,310:459)=mask;
SC(310:459,310:459)=mask;
a = uint8(SC);
imshow(a)
imhist(a)
axis([-50 300 0 100000])
title('histogram of gray leve')
xlabel('Gray level')
ylabel('Numbers of pixel')
b=43036/(512*512);
c=90000/(512*512);
test = zeros(256,1);
test(100,1)=b;
test(155,1)=b;
test(255,1)=b;
test(1,1)=b;
test(175,1)=c;
x=0:255;
bar(x,test)
title('probability of image pixel')
ylabel('numbers of pixel')
xlabel('Gray level')