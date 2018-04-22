function [centers, cost_vec] = Simplex_Method(x0, func_handle, maxiter, epsilon, alpha, cost_handle)
%alpha is recommended to be set to 2, in 2D smaller alpha results in
%shrinking the simplex, bigger alpha results in expanding the simplex
%none of the coordinates of x0 should be zero
%epsilon gives the tolerance of error in the final solution: set is lower
%to get more accurate results

x0 = (x0(:))';
dim = length(x0);
x_vec = zeros(dim+1,dim);
x_vec(1,:) = x0;
cost_vec = [];
k = 0;
centers = [];
start_cost = cost_handle(x0);

for i = 1:dim
    temp = zeros(1,dim);
    temp(i) = x0(i)*0.05;
    x_vec(1+i,:) = x0+temp;
end

fvals = zeros(dim+1,1);

for j=1:dim+1
    fvals(j) = func_handle(x_vec(j,:));
end

f_mean = mean(fvals);
err = 1/(dim+1) * sum((fvals-f_mean).^2);

while err > epsilon & k<maxiter
    k = k+1;
    [~,idx] = max(fvals);
    center = mean(x_vec,1);
    cost_vec(k) = cost_handle(center);
    centers(k,:) = center;
    x_new = center + (center-x_vec(idx,:))*alpha;
    new_fval = func_handle(x_new);
    alpha_2 = alpha*0.9;
    while sum(new_fval>fvals)>=dim %shrink
        x_new = center + (center-x_vec(idx,:))*alpha_2;
        new_fval = func_handle(x_new);
        alpha_2 = alpha_2*0.95;
    end
    x_vec(idx,:) = x_new;
    disp(k);
    for j=1:dim+1
        fvals(j) = func_handle(x_vec(j,:));
    end
end
cost_vec = [start_cost, cost_vec];
centers = [x0; centers];

    