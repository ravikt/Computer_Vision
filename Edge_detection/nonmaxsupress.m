%% Non maximum supression

function [output] = nonmaxsupress(g, theta)

[m,n]=size(g);
output=zeros(m,n);

for i=2:m
   for j=2:n
       switch theta(i,j)
           case 0
               if (g(i,j) >= g(i-1,j)) && ((g(i,j) >= g(i+1,j)))
                   output(i,j)=255;
               else
                   break;
               end
           case 45
               if (g(i,j) >= g(i-1,j-1)) && ((g(i,j) >= g(i+1,j+1)))
                   output(i,j)=255;
               else
                   break;
               end
           case 90
               if (g(i,j) >= g(i,j+1)) && ((g(i,j) >= g(i,j-1)))
                   output(i,j)=255;
               else
                   break;
               end
           case 135
               if (g(i,j) >= g(i-1,j+1)) && ((g(i,j) >= g(i+1,j-1)))
                   output(i,j)=255;
               else
                   break;
               end
           otherwise
               output(i,j)=0;
       end
   end
end

end
