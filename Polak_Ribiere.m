function [x_vec, cost_vec] = Polak_Ribiere(x0, func_handle, maxiter, cost_handle, angle_condition)
% angle_condition: set to 1 is angle condition is to be enforced, in that
% case epsilon is set to 0.1
x_vec = [];
x_vec(1,:) = (x0(:))';
cost_vec = [];
k = 0;
[~, grad, ~] = func_handle(x_vec(end,:));
epsilon = 0.1;
start_cost = cost_handle(x0);

while grad ~=0 & k<maxiter
    if angle_condition == 0
        if k == 0;
            d = -grad;
        else
            d = -grad + (grad'*(grad-prev_grad))/(norm(prev_grad))^2 * prev_d;
        end
    else
        if k == 0;
            d = -grad;
        else
            s = -grad + (grad'*(grad-prev_grad))/(norm(prev_grad))^2 * prev_d;
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
    end
    prev_d = d;
    prev_grad = grad;
    alfa = Armijo(func_handle, x_vec(end,:), d, 1, 0.8, 0.5);
    x_vec(end+1,:) = x_vec(end,:) + alfa*d';
    k = k+1;
    cost_vec(k) = cost_handle(x_vec(end,:));
    [~, grad, ~] = func_handle(x_vec(end,:));
    disp(k);
end
cost_vec = [start_cost, cost_vec];
