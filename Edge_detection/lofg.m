%% Laplacian of Gaussian
function [f] = lofg(sigma, n)
[x,y] = meshgrid(-n:n, -n:n);
f = (-1/(3.14*(sigma^4)))*(1 - x.^2/(2*sigma^2) - ...
    y.^2/(2*sigma^2)).*exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2));
end