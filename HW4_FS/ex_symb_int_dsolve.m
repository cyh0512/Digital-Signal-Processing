%Symbolic computation
% integration
syms x
int(x^2)
int(x, 1, 3)

syms x a b
a=1;
b=3;
y=int(x, a, b)

% int(S,v) is the indefinite integral of S with respect to v
syms x v
int(x*v,v)
 
syms x t
int(exp(-(t-x)))

% help file 
help sym/int
 
% dsolve Symbolic solution of ordinary differential equations.
 syms x(t) a
 dsolve(diff(x) == -a*x) 
 
 dsolve('Dx=-a*x')
 % ans = C1/exp(a*t)

 syms y
 dsolve('Dy+2*y=2, y(0)=4')
 % 3*exp(-2*t) + 1
 ezplot(y)
 
 %solution foe roots
 a=[1 1.25 0.375]
 p=roots(a)
 
 a=[1 1 2 8]
 p=roots(a)
 plot(real(p),imag(p),'x'); hold on
 x1=-3:0.1:3;
 y1=zeros(length(x1));
 plot(x1,y1)
 y2=-3:0.1:3;
 x2=zeros(length(y2));
plot(x2,y2)
 
  zplane(0,p)
 
 dsolve('D2y+0.25*Dy-0.375*y=0')
% C4*exp(t/2) + C5*exp(-(3*t)/4)