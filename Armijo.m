function [alfa] = Armijo(func_handle, x_vec, d_vec, alfa_start, sigma, gamma)
%suggested vals: alfa_start = 1, sigma = 0.7, gamma = 0.5
alfa = alfa_start;
[ref, grad, ~] = func_handle(x_vec);
while func_handle(x_vec+alfa*d_vec')-ref > gamma*alfa*grad'*d_vec
    alfa = sigma*alfa;
end