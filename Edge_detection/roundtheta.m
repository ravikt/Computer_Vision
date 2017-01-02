%% Roundtheta function

function [theta_new] = roundtheta(theta) 

theta=abs(theta);
[m,n]=size(theta);
theta_new=zeros(m,n);

for i=1:m
   for j=1:n
       
       if (0 <= theta(i,j)) && (theta(i,j) <= 22.5) 
           theta_new(i,j) = 0;
       elseif (157.5 <= theta(i,j)) && (theta(i,j) <= 180)
           theta_new(i,j) = 0;
       elseif (22.5 <= theta(i,j)) && (theta(i,j) <= 67.5)
           theta_new(i,j) = 45;
       elseif (67.5 <= theta(i,j)) && (theta(i,j) <= 112.5)
           theta_new(i,j) = 90;
       else
           theta_new(i,j) = 135;
       end
           
   end
end

end
