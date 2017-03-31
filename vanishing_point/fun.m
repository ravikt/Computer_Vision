function f = fun(x)
%x(1)x(2)N Sx(2)mmary ox(1) this x(1)x(2)nction goes here
%   Detailed explanation goes here
p=[-6.347811916579597e+02,1.620160032739883e+03;4.513642857142632e+03,1.472500000000001e+03;9.014523809523822e+02,5.810217239281858];


f(1) = p(1,1)*(p(1,1)/x(1)^2 - (p(3,1)*x(2))/x(1)^2) - p(3,1)*((p(1,1)*x(2))/x(1)^2 - p(3,1)*(x(2)^2/x(1)^2 + x(3)^2/x(1)^2 + 1) + (p(2,1)*x(3))/x(1)^2) + p(2,1)*(p(2,1)/x(1)^2 - (p(3,1)*x(3))/x(1)^2), p(1,2)*(p(1,1)/x(1)^2 - (p(3,1)*x(2))/x(1)^2) - p(3,2)*((p(1,1)*x(2))/x(1)^2 - p(3,1)*(x(2)^2/x(1)^2 + x(3)^2/x(1)^2 + 1) + (p(2,1)*x(3))/x(1)^2) + p(2,2)*(p(2,1)/x(1)^2 - (p(3,1)*x(3))/x(1)^2);
f(2) = p(1,1)*(p(1,2)/x(1)^2 - (p(3,2)*x(2))/x(1)^2) - p(3,1)*((p(1,2)*x(2))/x(1)^2 - p(3,2)*(x(2)^2/x(1)^2 + x(3)^2/x(1)^2 + 1) + (p(2,2)*x(3))/x(1)^2) + p(2,1)*(p(2,2)/x(1)^2 - (p(3,2)*x(3))/x(1)^2), p(1,2)*(p(1,2)/x(1)^2 - (p(3,2)*x(2))/x(1)^2) - p(3,2)*((p(1,2)*x(2))/x(1)^2 - p(3,2)*(x(2)^2/x(1)^2 + x(3)^2/x(1)^2 + 1) + (p(2,2)*x(3))/x(1)^2) + p(2,2)*(p(2,2)/x(1)^2 - (p(3,2)*x(3))/x(1)^2);

end

% [  1/x(1)^2,      0,                -x(2)/x(1)^2]
% [      0,  1/x(1)^2,                -x(3)/x(1)^2]
% [ -x(2)/x(1)^2, -x(3)/x(1)^2, x(2)^2/x(1)^2 + x(3)^2/x(1)^2 + 1]