
clear all;
close all;
image=imread('image.jpg');

filter  = gaussian(1.4, 5, 2);
sobelx  = [-1,0,1;-2,0,2;-1,0,1];
sobely  = [1,2,1;0,0,0;-1,-2,-1];
% applying gaussian filter 
answ = operation(image,filter);

% Calculation of intensity gradient 
gx   = operation(answ,sobelx);
gy   = operation(answ,sobely);
g    = hypot(gx,gy);
theta= atan2d(gy,gx);

c = roundtheta(theta);
final_image=nonmaxsupress(g,c);
[th, tl] = thresh(g);
