% Define the function f(x)
syms x
f = x^3;

c = 0; % y-axis

a = 0;
b = 2;

% Calculate the volume of the solid of revolution
V = pi * int((f - c)^2, a, b);

fprintf('Volume of the solid of revolution around y = %d: %.4f cubic units\n', c, double(V));

% Plotting in 2D

fx = inline(vectorize(f));
xvals = linspace(a, b, 201);
yvals = fx(xvals);

figure;
plot(xvals, yvals, 'b-', 'LineWidth', 2);
hold on;

% Plot the region bounded by the lines and curves
fill([a, xvals, b, a], [c, yvals, c, c], 'g', 'FaceAlpha', 0.3);

% Plot the lines and curves
plot([a, b], [c, c], '-r', 'LineWidth', 2);
xlabel('X-axis');
ylabel('Y-axis');
title('Region Bounded by y = x^3, y = 0, and x = 2');

% Show the grid
grid on;

% Display the plot
hold off;
