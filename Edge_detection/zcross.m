function [output] = zcross(image)
[m,n]=size(image);
output=zeros(m,n);
for i=5:m-5
   for j=5:n-5
       if sign(image(i,j+1)) ~= sign(image(i,j-1)) || sign(image(i-1,j)) ~= sign(image(i+1,j))
           output(i,j)=image(i,j);
       elseif sign(image(i-1,j+1)) ~= sign(image(i+1,j-1)) || sign(image(i-1,j-1)) ~= sign(image(i+1,j+1))
            output(i,j)=image(i,j);
       else
           output(i,j)=0;
       end
       
   end
end
end
