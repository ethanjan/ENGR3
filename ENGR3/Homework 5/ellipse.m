%define the t values for the parametrization
t = linspace(0,2*pi,100);
%define the x values of the parametrization
x = 3 + 6*cos(t);
%define the y values of the parametrization
y = -2 + 9*sin(t);


%perform option 1 (translation) on the ellipse and plot the result
[x1,y1] = geometric(x,y,1);
figure(1);
plot(x1,y1);
title('translation')
xlabel('x')
ylabel('y')
axis equal;

%perform option 2 (scaling) on the ellipse and plot the result
[x2,y2] = geometric(x,y,2);
figure(2);
plot(x2,y2);
title('scaling')
xlabel('x')
ylabel('y')
axis equal;

%perform option 3 (rotation) on the ellipse and plot the result
[x3,y3] = geometric(x,y,3);
figure(3);
plot(x3,y3);
title('rotation')
xlabel('x')
ylabel('y')
axis equal;

%perform option 4 (reflection) on the ellipse and plot the result
[x4,y4] = geometric(x,y,4);
figure(4);
plot(x4,y4);
title('reflection')
xlabel('x')
ylabel('y')
axis equal;
