*******%CIRCLE
clc
clear all
syms r a b
r= input('Enter the radius of the circle')
a= input('Enter the x coordinate of the center')
b= input('Enter the y coordinates of the center')
t = linspace(0, 2*pi, 100);
x = a+r*cos(t);
y = b+r*sin(t);
axis equal
plot(x, y)
xlabel('x-Coordinate')
ylabel('x-Coordinate')
title(('x − a)2 + (y − b)2 = r2'))




********% Evaluating line integrals
clc
clear all
syms x y z t
F=input('Enter the 3D vector-valued function in the form [f1,f2,f3]:');
R=input('Enter x, y and z in the parametric form:');
I=input('Enter the limits of integration for t in the form [a,b]:');
a=I(1);b=I(2);
dR=diff(R,t);
Fr=subs(F,{x,y,z},R);
FrdR=sum(Fr.*dR);
LI=int(FrdR,t,a,b)
P(x,y,z)=F(1);Q(x,y,z)=F(2);S(x,y,z)=F(3);
x1=linspace(0,1,11);y1=x1;z1=x1;
[X,Y,Z]=meshgrid(x1,y1,z1);
U=P(X,Y,Z);V=Q(X,Y,Z);W=S(X,Y,Z);
quiver3(X,Y,Z,U,V,W);
hold on
t1=linspace(0,1,101);
x=subs(R(1),t1);y=subs(R(2),t1);z=subs(R(3),t1);
plot3(x,y,z,'r');




*******%GREENS THEOREM
clear
clc
syms x y t
F=input('Enter the vector function M(x,y)i+N(x,y)j in the form [M N]:');
M(x,y)=F(1);N(x,y)=F(2);
r=input('Enter the parametric form of the curve C as [r1(t) r2(t)]:');
r1=r(1);r2=r(2);
P=M(r1,r2);Q=N(r1,r2);
dr=diff(r,t);
F1=sum([P,Q].*dr);
T=input('Enter the limits of integration for t [t1,t2]:');
t1=T(1);t2=T(2);
LHS=int(F1,t,t1,t2);
yL=input('Enter limits for y in terms of x: [y1,y2]:');
xL=input('Enter limits for x as constants:[x1,x2]:');
y1=yL(1);y2=yL(2);x1=xL(1);x2=xL(2);
F2=diff(N,x)-diff(M,y);
RHS=int(int(F2,y,y1,y2),x,x1,x2);
if(LHS==RHS)
    disp('LHS of Greens theorm:')
    disp(LHS)
    disp('RHS of Greens theorm:')
    disp(RHS)
    disp('Hence Greens theorm is verified')
end





*******%CURL
clear
clc
syms x y z
f=input('Enter the 3D vector function in the form [f1,f2,f3]:');
P(x,y,z)=f(1);q(x,y,z)=f(2);r(x,y,z)=f(3);
crl=curl(f,[x,y,z])
c1(x,y,z)=crl(1);c2(x,y,z)=crl(2);c3(x,y,z)=crl(3);
x=linspace(-4,4,10);y=x;z=x;
[X,Y,Z]=meshgrid(x,y,z);
U=P(X,Y,Z);V=q(X,Y,Z);W=r(X,Y,Z);
CR1=c1(X,Y,Z);CR2=c2(X,Y,Z);CR3=c3(X,Y,Z);
figure;
subplot(1,2,1);
quiver3(X,Y,Z,U,V,W);
title('3D view of vector field');
subplot(1,2,2);
quiver3(X,Y,Z,CR1,CR2,CR3);
title('3D view of curl')



******%DIVERGANCE
clear
clc
syms x y
f=input('2d vector in the form [f1,f2]')
div(x,y)=divergence(f,[x,y])
P(x,y)=f(1);Q(x,y)=f(2);
x=linspce(-4,4,20);y=x;
[X,Y]=meshgrid(x,y);
U=P(X,Y);V=Q(X,Y);
figure
pcolor(X,Y,div(X,Y))
shading interp
hold on;
quiver(X,Y,U,V,1)
axis on 
hold off;
title('vector field of F(x,y)=[f1,f2]')



*******%GRADIENT
clear
clc
syms x y
f= input("enter the function f(x,y):");
grad=gradient(f,[x,y])
P(x,y)=grad(1);Q(x,y)=grad(2)
x=linspace(-2,2,10);y=x;
[X,Y]=meshgrid(x,y)
U=P(X,Y);V=Q(X,Y);
quiver(X,Y,U,V,1)
hold on 
fcontour(f,[-2,2])




*******%AREA BETWEEN THE CURVES
clc
clear
syms x
y1=input("ENTER the upper curve as a function of x : ");
y2=input("ENTER the lower curve as a function of x :" );
t=solve(y1-y2);
t=double(t);
A=int(y1-y2,t(1),t(2))
D=[t(1)-0.2 t(2)+0.2];
ez1=ezplot(y1,D);
set(ez1,'color','r')
hold on
ez2=ezplot(y2,D);
set(ez2,'color','g')
xv = linspace(t(1),t(2));
y1v =subs(y1,x,xv);
y2v = subs(y2,x,xv);
x = [xv,xv];
y = [y1v,y2v];
fill(x,y,'b')



*******% 2. To find the maxima and minima of the single variable % function and visualize it.
clc
clear all
syms x real
f= input ('Enter the function f(x): '); %Example: f=x^3-2*x+4 & ×^3* (x-5) ^2 fx = diff (f, ×);
fxx = diff(fx, x) ;
c = solve (fx)
c = double (c)
for i = 1:length(c)
    T1 = subs (fxx, x , c(i) )
    T1 = double (T1);
    T3 = subs(f, x, c(i));
    T3 = double(T3);
    if (T1 == 0)
        sprintf('The inflection point is x = %d.',c(i))
    else if (T1 < 0)
        sprintf('The maximum point x is %d', c(i))
        sprintf('and the maximum value of the function is %d.', T3)
    else 
        sprintf('The minimum point × is %d', c(i))
        sprintf('and the minimum value of the function is %d', T3)
    end
    end
cmin = min(c);
cmax = max(c);
D = [cmin-2, cmax+2];
ezplot (f,D)
hold on
plot(c(i), T3, 'g*', 'markersize', 15);
end





*******%MAXIMA MINIMA 2 VARIABLE
clc 
clear
syms x y
f(x,y) = input('Enter the function f(x,y):');
%f(x,y)=2*(×^2-у^2)-×^4+у^4, % f(x,y)=(x+5)^2+^2+(x-1)^2+(y-7)^2+(x-9)^2+y^2+×^2+(y+8)^2 p = diff(f‚x); q=diff(f,y) ;
[ax, ay] = solve (p, q);
ax = double (ax); ay=double (ay);
r = diff(p,x); s = diff (p,y) ; t = diff (q,y); D = p*t-s^2;
figure
fsurf(f);
legstr={'Function Plot'}; % For legend for i=1:size(ax)
T1=D(ax(i),ay(i));
T2=r(ax(i),ay(i));
T3=f(ax(i),ay(i));
if(double (T1)==0)
sprintf('At (%f,%f) further investigation is required',ax(i),ay(i))
legstr = [legstr, {'Case of Further investigation'}];
mkr = 'ko';
elseif (double(T1)<0)
sprintf('The point (%f,%f) is a saddle point', ax(i), ay(i))
legstr = [legstr, {'Saddle Point'}]; % updating Legend
mkr ='bv'; % marker else
if (double(T2) < 0)
sprintf('The maximum value of the function is f(%f,%f)=%f', ax(i), ay(i), T3)
legstr= [legstr, {'Maximum value of the function'}];% updating Legend
mkr='g+';% marker else
sprintf('The minimum value of the function is f(%f,%f)=%f', ax(i), ay(i), T3)
legstr = [legstr, {'Minimum value of the function'}];% updating Legend
mkr='r*'; % marker 
end
end
hold on
plot3(ax(i), ay(1), T3, mkr, 'Linewidth',4);

legend (legstr, 'Location', 'Best');



********%LAGRANGERS MULTIPLIERS
clc
clear all
syms x y L
f=input('Enter the function f(x,y):');
g=input('Enter th constraint function g(x,y):');
F=f-L*g;
gradF=jacobian(F,[x,y]);
[L,x1,y1]=solve(g,gradF(1),gradF(2),'Real',true);% Solving only for real x & y
x1=double(x1)
y1=double(y1)
x_max=max(x1);x_min=min(x1);
y_max=max(y1);y_min=min(y1);
range=[x_min-5 x_max+5 y_min-5 y_max+5];% Setting plot range

% Figure
ezmesh(f,range);
hold on; grid on;
h=ezplot(g,range);
set(h,'Color','r','LineWidth',2);
title('');
tmp=get(h,'contourMatrix');
xdt=tmp(1,2:end);% Avoiding first x-data point
ydt=tmp(2,2:end);% Avoiding first y-data point
zdt=subs(f,{x,y},{xdt,ydt});
zdt=double(zdt);
plot3(xdt,ydt,zdt,'-g','LineWidth',2);
axis(range);
for i=1:numel(x1)
    G(i)=subs(f,[x,y],[x1(i),y1(i)]);
    plot3(x1(i),y1(i),G(i),'.k','MarkerSize',50);
end

title('Constrained Maxima/Minima');



*******% Graph of a curve and its tangent line in the neighbourhood D of a point. 
clc 
clear all
syms x
y = input('Enter the function f in terms of x: ')
x1= input ("Enter x value at which tangent");
D = [x1-2 x1+2] % Region about ×1 (or Neighbourhood of x1)
ezplot (y,D) % graph of the curve in D hold on
% Next, equation of the tangent line passing through point x1.
yd = diff(y,x); % Differentiation in MATLAB
slope = subs (yd,x,x1); % Finding the slope at 
y1 = subs (y,x,x1);
% Finding the value of the function at the given point
plot (x1,1, 'ko')
% plot the point
Tgt_line = slope* (x-x1)+1 % Tangent Line Equation at the given point
h = ezplot{Tgt_line,D};
% Plotting the Tangent Line
set(h,'color', 'b')



******%LANGRANGER 3 VARIABLE
clc
clearvars
syms x y z L
f = input('Enter the function f(x,y,z): ');
g = input('Enter the constraint function g(x,y,z): ');
F = f + L*g;
gradF = jacobian(F,[x,y,z]);
[L,x1,y1,z1] = solve(g,gradF(1),gradF(2),gradF(3));
Z = [x1 y1 z1];
disp('[x y z]=')
disp(Z)


%1. Plot the function and its derivatives
clc 
clear all 
syms x real
f = input('Enter the function f(x): ');
% Example: f=x^3-2*x+4 and ×^3* (x-5) ^2
fx = diff (f, x) ;
fxx = diff (fx, x) ;
% Determine the critical points.
D = [0, 5];
l= ezplot (f, D)
set (1, 'color', 'b');
hold on
h = ezplot (fx, D);
set (h, 'color','r');
e = ezplot (fxx, D) ;
set (e, 'color', 'g');
legend ('f', 'fx', 'fxx')
legend('Location', 'northeastoutside')





% Definite integrals and its applications
% 3. To find the area of the regions enclosed by curves and visualize it.
clc 
clear all
syms x
y1 = input('Enter the upper curve as a function of x: ');
y2 = input('Enter the lower curve as a function of x: ');
% Try the curves: y=x and y=×^2-2*x;
t = solve (y1-y2);
t = double(t);
A = int(y1-y2,t(1),t(2))
D = [t(1) -0.2 t (2)+0.2];
ez1 = ezplot (y1,D);
set (ez1, 'color', 'r') 
hold on
ez2 = ezplot (y2,D);
set (ez2, 'color', 'g')
xv = linspace(t(1), t (2));
ylv = subs (y1, x, xv) ;
y2v = subs (y2, x, xv) ;
X = [xv, xv];
y = [ylv,y2v];
fill(x,y, 'b')




% Draw a circle with labels
clc 
clear all 
syms r a b
r = input ("Enter the radius of the circle: ")
a = input ("Enter the x coordinate of the center: ")
b = input ("Enter the y coordinates of the center: ")
t = linspace(0, 2*pi, 100);
X = a+r*cos(t);
y = b+r*sin(t);
axis equal plot (x, y)
title(' (x-a)^2+(y-b)^2=p^2')
xlabel('x-coordinate')
ylabel('y-coordinate')



% Multiple plots using hold on 
clc 
clear all
x = linspace(0, 1, 100); 
plot (x, x.^2, 'r','Linewidth' ,2.0)
hold on
plot (x, cos(x), 'g', 'Linewidth',2.0)
hold on 
plot(sin(x), 'b', 'Linewidth',2.0)
hold on
plot(x, exp(x), 'c', 'Linewidth', 2.0)
legend('x^2','cos (x) ' , 'sin(x) ' , 'e^(x}')




% Multiple graphs in a Figure with command subplot 
clc 
clear all
x=0:0.1:2*pi;
subplot (2,2,1) 
plot (x, sin(x));
title('sin(x)')
subplot (2,2,2)
plot (x, cos (x), 'r-*');
title('cos (x)')
subplot (2,2,3)
plot(x, exp(-x), 'go')
title('e^[-x}')
subplot (2,2,4);
plot(x,sin(3*x), 'ms')
title('sin(3x)')




% Multiple plots without command "hold on" 
clc 
clear all
x= linspace(0, 1, 200);
plot (x,sin(x), x, cos (x),x, x.^3, x, tan(x), 'Linewidth' ,2.0) 
legend ("sin(x)', cos(x)', x^3', tan(x)"))







% Plot the curve using "ezplot"
clc 
clear all
syms x % Declaring the parameters as a symbolic object
f = sin(2*x)+cos(3*x)
figure(1)
ezplot(f)
figure(2)
ezplot (f, [0, 3])


%triple integration
clear
clc
syms x y z
xa=-2;
xb=2;
ya=-sqrt(2-x^2/2);
yb=sqrt(2-x^2/2);
za=x^2+3*y^2;
zb=8-x^2-y^2;
I=int(int(int(1+0*z,z,za,zb),y,ya,yb),x,xa,xb)
viewSolid(z,za,zb,y,ya,yb,x,xa,xb)
