function [res, grad, Hessian] = Rosenbrock(x_vec)
x_vec = x_vec(:);
grad = zeros(size(x_vec));
Hessian = zeros(length(x_vec), length(x_vec));
res = 100*(x_vec(2)-x_vec(1)^2)^2+(1-x_vec(1))^2;
grad(1) = 400*x_vec(1)^3-400*x_vec(1)*x_vec(2)-2+2*x_vec(1);
grad(2) = 200*x_vec(2)-200*x_vec(1)^2;
Hessian(1,1) = 1200*x_vec(1)^2-400*x_vec(2)+2;
Hessian(1,2) = -400*x_vec(1);
Hessian(2,1) = -400*x_vec(1);
Hessian(2,2) = 200;
end