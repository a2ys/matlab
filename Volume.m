% Define the function f(x)
syms x
f = x^2;

c = 2;

a = 0;
b = 1;

V = pi * int((f - c) ^ 2, a, b);

fprintf('Volume of the solid of revolution around y = %d: %.4f cubic units\n', c, double(V));

% Plotting

fx = inline(vectorize(f));
xvals = linspace(fL(1), fL(2), 201);
xvalsr = fliplr(xvals);
xivals = linspace(a, b, 201);
xivalsr = fliplr(xivals);
xlim = [fL(1) fL(2)+0.5];
ylim = fx(xlim);

[X,Y,Z] = cylinder(fx(xivals)-c,100);
figure("Position",[700 200 560 420])
Z = a + Z.*(b-a);
surf(Z,Y+c,X,"EdgeColor","none","FaceColor","flat","FaceAlpha",0.6);
hold on;
plot([a b],[c c],"-r","LineWidth",2);
xlabel("X-axis");
ylabel("Y-axis");
zlabel("Z-axis");
view(22,11);
