clc
clear all

syms x y z

F = input('Enter the vector field as [i, j, k] in vector form: ');

P = inline(vectorize(F(1)), 'x', 'y','z');
Q = inline(vectorize(F(2)), 'x', 'y','z');
R = inline(vectorize(F(3)), 'x', 'y','z');

% Define the grid
x = linspace(-1, 1, 5);
y = x;
z = x;
[X, Y, Z] = meshgrid(x, y, z);

% Calculate the components of the vector field on the grid
U = P(X,Y,Z);
V = Q(X,Y,Z);
W = R(X,Y,Z);

% Plot the 2D vector field using quiver
quiver3(X,Y,Z,U,V,W,1.5)
axis on
xlabel('x')
ylabel('y')
zlabel('z')
