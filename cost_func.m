function [cost] = cost_func(x_vec)
%cost = log((x_vec(1)-1)^2+(x_vec(2)-1)^2);
cost = (x_vec(1)-1)^2+(x_vec(2)-1)^2;
end