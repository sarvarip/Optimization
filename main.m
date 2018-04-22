%Structure follows the Coursework given by Professor Alessandro Astolfi as
%part of the Optimisation course at Imperial College, London

close all
maxiter=1000;

%Gradient Method
[x_vec, cost_vec] = Gradient_Method([-3/4 1], @Rosenbrock, maxiter, @cost_func);
figure
plot(1:length(cost_vec), cost_vec);
title('Gradient Method: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('Gradient Method: Points obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;

%Newton Method
[x_vec, cost_vec] = Newton_Method([-3/4 1], @Rosenbrock, 0.3, maxiter, @cost_func);
figure
plot(1:length(cost_vec), cost_vec);
title('Newton Method: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('Newton Method: Points obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;

%Polak-Ribiere Method without angle condition
[x_vec, cost_vec] = Polak_Ribiere([-3/4 1], @Rosenbrock, maxiter, @cost_func, 0);
figure
plot(1:length(cost_vec), cost_vec);
title('Polak-Ribiere Method without angle condition: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('Polak-Ribiere Method without angle condition: Points obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;

%Polak-Ribiere Method with angle condition
[x_vec, cost_vec] = Polak_Ribiere([-3/4 1], @Rosenbrock, maxiter, @cost_func, 1);
figure
plot(1:length(cost_vec), cost_vec);
title('Polak-Ribiere Method with angle condition: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('Polak-Ribiere Method with angle condition: Points obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;

%BFGS Method
[x_vec, cost_vec] = BFGS([-3/4 1], @Rosenbrock, maxiter, @cost_func);
figure
plot(1:length(cost_vec), cost_vec);
title('BFGS Method: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('BFGS Method: Points obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;

%Simplex Method
[x_vec, cost_vec] = Simplex_Method([-3/4 1], @Rosenbrock, maxiter, 10^-5, 2, @cost_func);
figure
plot(1:length(cost_vec), cost_vec);
title('Simplex Method: cost vs. iteration', 'FontSize', 20);
xlabel('Iteration', 'FontSize', 16);
ylabel('Cost', 'FontSize', 16);
figure
plot(x_vec(:,1), x_vec(:,2));
title('Simplex Method: Centres obtained', 'FontSize', 20);
xlabel('X coordinate', 'FontSize', 16);
ylabel('Y coordinate', 'FontSize', 16);
%pause;