function [ outim ] = hyster( gh, gl)
%HYSTER Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(gh);
gl = gl-gh;
outim = zeros(m,n);% final output image after hysteresis thrsholding

for i=2:m-1
   for j=2:n-1
       while gh(i,j) ~= 0
           outim(i,j)=gh(i,j);
           if gl(i,j+1) ~= 0 
               outim(i,j+1) = gl(i,j+1);
           end
           if gl(i,j-1) ~= 0
               outim(i,j-1) = gl(i,j-1); 
           end
           if gl(i-1,j) ~= 0
               outim(i-1,j) = gl(i-1,j);
           end
           if gl(i+1,j) ~= 0
               outim(i+1,j) = gl(i+1,j); 
           end
           if gl(i-1,j+1) ~= 0
               outim(i-1,j+1) = gl(i-1,j+1);
           end
           if gl(i+1,j+1) ~= 0
               outim(i+1,j+1) = gl(i+1,j+1);
           end
           if gl(i-1,j-1) ~= 0
               outim(i-1,j-1) = gl(i-1,j-1);
           end
           if gl(i+1,j-1) ~= 0
               outim(i+1,j-1) = gl(i+1,j-1);
           end
       end
   end
end

end

