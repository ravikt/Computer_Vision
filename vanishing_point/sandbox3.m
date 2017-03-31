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
%vp = zeros(3,2);

for j=1:3
  for i=1:3
 
    [x,y] = ginput(2);
    plot(x, y, 'b')
%   a(i,:)=x;
%   b(i,:)=y;
    A(i,:) = polyfit(x,y,1);  
  end
  b = A(:,2);
  a(:,1) = -A(:,1);
  vp(j,:) = (pinv(a)*b)';
  plot(vp(j,:), '*r');
  hold on
end
