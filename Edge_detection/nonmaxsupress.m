%% Non maximum supression

function [output] = nonmaxsupress(g, theta)

[m,n]=size(g);
output=zeros(m,n);

for i=1:m
   for j=1:n
       switch theta(i,j)
           case 0
           case 45
           case 90
           case 135
       end
   end
end

end
