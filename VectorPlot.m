clc
clear all

syms x y

F = input('Enter the vector field as [i, j] in vector form: ');

P = inline(vectorize(F(1)), 'x', 'y');
Q = inline(vectorize(F(2)), 'x', 'y');

% Define the grid
x = linspace(-1, 1, 10);
y = x;
[X, Y] = meshgrid(x, y);

% Calculate the components of the vector field on the grid
U = P(X, Y);
V = Q(X, Y);

% Plot the 2D vector field using quiver
quiver(X, Y, U, V, 1);
axis on;
xlabel('x');
ylabel('y');
