image = imread('black_strip.jpg');
F = fft2(double(image));
mag = abs(fftshift(F));
phase = angle(fftshift(F));
F_Phase = exp(1i*angle(F));
re = mag .* cos(phase);
im = mag .* sin(phase);
F = re + 1i*im;
f = ifft2(F);
imshow(phase,[-pi pi])  %phase
title('phase')
figure
imshow(mag,[24 100000])
title('amp')
figure
imshow(ifft2(ifftshift(phase)))
I_Phase = ifft2(F_Phase);

I_Phase_min = min(min(abs(I_Phase)));
I_Phase_max = max(max(abs(I_Phase)));
imshow(abs(I_Phase),[I_Phase_min I_Phase_max])