clear all;
close all;
image=imread('image.jpg');

%image = double(rgb2gray(image));

sobelx  = [-1,0,1;-2,0,2;-1,0,1];
sobely  = [1,2,1;0,0,0;-1,-2,-1];
filter  = gaussian(1.4, 5, 2);

% Calculation of intensity gradient 
% gx   = conv2(sobelx,image);
% gy   = conv2(sobely,image);
% Ix   = conv2(filter,gx);
% Iy   = conv2(filter,gy);
gx   = operation(image,sobelx);
gy   = operation(image,sobely);
Ix   = operation(gx,filter);
Iy   = operation(gy,filter);
%[ans] = corn(Ix,Iy);


k=0.04;
thresh = 0.0000000001;
% Components
A = Ix.^2;
B = Ix.*Iy;
C = Iy.^2;

g = hypot(Ix,Iy);
theta= atan2d(Iy,Ix);
c = roundtheta(theta);

[m,n] = size(A);

outimage = zeros(m,n);

for i=1:m
    for j=1:n
        % Caculation of harris matrix
        h = [A(i,j),B(i,j);B(i,j),C(i,j)];
        l=eig(h);
%         mc = (det(h) - k*(trace(h)^2));
        lmin(i,j)=min(l);
        lmax=max(l);
         if lmin(i,j) > thresh
            outimage(i,j) = g(i,j) ; 
         end
    end
end
final_image=nonmaxsupress(lmin,outimage,c);