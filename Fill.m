% Define the parabola equation
x_parabola = linspace(-5, 5, 100);
y_parabola = x_parabola.^2;

% Define the line equation
x_line = linspace(-4, 4, 100);
y_line = 2 * x_line + 3;

% Plot the parabola
figure;
plot(x_parabola, y_parabola, 'b-', 'LineWidth', 2);
hold on;

% Plot the line
plot(x_line, y_line, 'r-', 'LineWidth', 2);

% Fill the region enclosed by the parabola and the line
fill([x_parabola, fliplr(x_line)], [y_parabola, fliplr(y_line)], 'g', 'FaceAlpha', 0.3);

% Set axis labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Enclosed Region by Parabola and Line');

% Add legend
legend('Parabola', 'Line', 'Enclosed Region');

% Show the grid
grid on;

% Display the plot
hold off;
