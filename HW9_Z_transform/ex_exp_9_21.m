
%case I: real 
a=-0.8;
C=2;
n=0:10;
y=C.*a.^n;
stem(n,y)

%case II: complext
% C= A*exp(j.*phi)
f=5;
phi=0.25*pi;
omega=2*pi*f;
n=0:0.01:1;
C=1.*exp(j*phi);
a=exp(j.*omega*n);
y=C.*a;
plot(n,real(y));

%case IIII
f=5;
phi=0.25*pi;
omega=2*pi*f;
sigma=-2;
n=0:0.01:1;
C=1.*exp(j*phi);
a=exp((sigma+j.*omega)*n);
y=C.*a;
plot(n,real(y));hold on;
stem(n,real(y))






