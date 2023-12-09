clc
clear all
syms x y lambda

f = input("Enter function: ");
g = input("Enter constraint: ");

L = f - lambda * g;

dL_dx = diff(L, x);
dL_dy = diff(L, y);
dL_dl = diff(L, lambda);

eqns = [dL_dx == 0 dL_dy == 0 dL_dl == 0];
sol = solve(eqns, [x y lambda]);

best_value = subs(f, [x  y], [sol.x sol.y])
