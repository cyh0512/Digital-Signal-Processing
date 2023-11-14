syms t
x1=2*cos(2*pi*100*t);
x2=5*cos(2*pi*500*t);
x3=x1*x2;
FT_x3=fourier(x3);
