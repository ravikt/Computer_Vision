clear all;
close all;

figure(1)
im = imread('img1.jpg');
hold off, 
imagesc(im)
hold on 

a=ones(3,2); % 
b=zeros(3,1); % 
A = zeros(3,2);
vp = zeros(3,2);

for j=1:3
  for i=1:3
 
    [x,y] = ginput(2);
    plot(x, y, 'b')
%   a(i,:)=x;
%   b(i,:)=y;
    A(i,:) = polyfit(x,y, 1);  
  end
  b = A(:,2);
  a(:,1) = -A(:,1);
  vp(j,:) = (pinv(a)*b)';
  VP(j,:) = inv(a'*a)*a'*b;
  %plot(vp(j,:), '*r');
  hold on
  plot(VP(j,:), '*r');
  hold on
end

%plot([vp(1,1) vp(2,1)], [vp(1,2), vp(2,2)], 'b');
hold on
plot([VP(1,1) VP(2,1)], [VP(1,2), VP(2,2)], 'r');


%calculating camera intrinsic

fxn = @(x)VP'*x*VP - [0,0;0,0];


x0 = [0.01, 0, -0.15; 0, 0.01, -0.15; -0.15, -0.15, 1.30];
fxn = @(x)VP'*x*VP - [0,0;0,0];
options = optimoptions('fsolve', 'Display', 'off');
[x, fval, exitflag, output] = fsolve(fxn, x0, options)
% x  = fsolve(@fun, x0);
f = sqrt(1/x(1,1))
u = -(x(1,3)*f^2)
v = -(x(2,3)*f^2)

%intrinsic matrix
k = [f, 0, u; 0, f, v; 0, 0, 1];

% Xi = [1,0,0;0,1,0;0,0,1];% direction of vanishing point
% R0 = ones(3); 
% fxn1 = @(R)k*R*Xi - VP;
% options = optimoptions('fsolve', 'Display', 'off');
% [R, fval, exitflag, output] = fsolve(fxn1, R0, options)
