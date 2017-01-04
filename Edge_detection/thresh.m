function [ gh,gl ] = thresh( g )
% THRESH 
% function for double thresholding
[m,n]=size(g);
gh=zeros(m,n);
gl=zeros(m,n);
l = 0.3*max(max(g));
h = 0.7*max(max(g));

for i=1:m
   for j=1:n
       if g(i,j) >= l
             gl(i,j)=g(i,j);
       end
       if g(i,j) >= h
             gh(i,j)=g(i,j);
       end
   end
end


end

