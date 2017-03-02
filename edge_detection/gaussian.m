%% Gaussian function
function [f] = gaussian(sigma, n, k)
%%
% sigma - standard deviation
% n - size of the mesh
% k - size of kernel
% [x,y] = meshgrid(-n:n, -n:n);
% f = exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2));
% surf(x,y,f)

%%
f=zeros(n,n);
for i=1:n
    for j=1:n
       f(i,j)=(-1/2*pi*sigma^2)*exp(((i-(k+1))^2 + (j-(k+1))^2)/(2*sigma^2));
    end
end
%surf(-n:n,-n:n,f)
end