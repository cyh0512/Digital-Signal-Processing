% step function
syms x t
x=heaviside(t)

%f=sin(3*t)
%laplace(f)

% exampple 7.11
syms f t d u
d=4*t-(pi/6);
u=heaviside(d)
f=sin(3*d) * u
laplace(f)


% How to plot x(t) = exp(-t)*u(t) using syms symbolic function
syms x
ezplot(heaviside(x)*exp(-x), [-2, 2])