#include<iostream>
#include<cmath>
using namespace std;

int main()
{
int index, xp, yp, tx = 512 / 2, ty = 512 / 2;
float x, y, radius, theta, PI = 3.141527f, DRAD = 180.0f / PI;
#pragma omp parallel for \
shared(inputImage, outputImage, width, height) \
private(x, y, index, radius, theta, xp, yp)
for (yp = 0; yp < 512; yp++) {
 for (xp = 0; xp < 512; xp++) {
 index = xp + yp * 512;
 radius = sqrtf((xp - tx) * (xp - tx) + (yp - ty) * (yp - ty));
 theta = (radius / 2) * DRAD;
 x = cos(theta) * (xp - tx) - sin(theta) * (yp - ty) + tx;
 y = sin(theta) * (xp - tx) + cos(theta) * (yp - ty) + ty;
 outputImage[index] = BilinearlyInterpolate(inputImage, width, height,
x, y);
 }
}
}
