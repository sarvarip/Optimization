function [x_vec, cost_vec] = Gradient_Method(x0, func_handle, maxiter, cost_handle)
x_vec = [];
x_vec(1,:) = (x0(:))';
cost_vec = [];
k = 0;
[~, grad, ~] = func_handle(x_vec(end,:));
start_cost = cost_handle(x0);

while grad ~=0 & k<maxiter
    d_vec = -grad;
    alfa = Armijo(func_handle, x_vec(end,:), d_vec, 1, 0.8, 0.5);
    x_vec(end+1,:) = x_vec(end,:) + alfa*d_vec';
    k = k+1;
    cost_vec(k) = cost_handle(x_vec(end,:));
    [~, grad, ~] = func_handle(x_vec(end,:));
    disp(k)
end
cost_vec = [start_cost, cost_vec];
