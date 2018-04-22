function [x_vec, cost_vec] = BFGS(x0, func_handle, maxiter, cost_handle)
%Broyden-Fletcher-Goldfarb-Shanno
x_vec = [];
x_vec(1,:) = (x0(:))';
cost_vec = [];
k = 0;
[~, grad, ~] = func_handle(x_vec(end,:));
start_cost = cost_handle(x0);

while grad ~=0 & k<maxiter
    if k == 0
        H = eye(2);
    else
        gamma = grad-grad_prev;
        delta = x_vec(end,:) - x_vec(end-1,:); %Note: this is already a row vector
        v = sqrt(gamma'*H_prev*gamma)*(delta'/(delta*gamma) - H_prev*gamma/(gamma'*H_prev*gamma));
        H = H_prev + delta'*delta/(delta*gamma) - H_prev*gamma*gamma'*H_prev/(gamma'*H_prev*gamma) + v*v';
    end
    H_prev = H;
    grad_prev = grad;
    d = -H*grad;
    alfa = Armijo(func_handle, x_vec(end,:), d, 1, 0.8, 0.5);
    x_vec(end+1,:) = x_vec(end,:) + alfa*d';
    k = k+1;
    cost_vec(k) = cost_handle(x_vec(end,:));
    [~, grad, ~] = func_handle(x_vec(end,:));
    disp(k);
end
cost_vec = [start_cost, cost_vec];

        