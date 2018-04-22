function [x_vec, cost_vec] = Newton_Method(x0, func_handle, epsilon, maxiter, cost_handle)
%suggested vals: epsilon = 0.3
x_vec = [];
x_vec(1,:) = (x0(:))';
cost_vec = [];
k = 0;
[~, grad, Hessian] = func_handle(x_vec(end,:));
start_cost = cost_handle(x0);

while grad ~=0 & k<maxiter
    if det(Hessian)<10^-3;
        d = -grad;
    else
        s = -inv(Hessian)*grad;
        if abs(grad'*s) < epsilon*norm(grad)*norm(s)
             d = -grad;
        else
            if grad'*s < 0
                d = s;
            else
                d = -s;
            end
        end
    end
    alfa = Armijo(func_handle, x_vec(end,:), d, 1, 0.8, 0.5);
    x_vec(end+1,:) = x_vec(end,:) + alfa*d';
    k = k+1;
    cost_vec(k) = cost_handle(x_vec(end,:));
    [~, grad, Hessian] = func_handle(x_vec(end,:));
    disp(k);
end
cost_vec = [start_cost, cost_vec];

        