syms t w
% heaviside    Step function.
%   heaviside(X) is 0 for X < 0, 1 for X > 0, and .5 for X == 0.
x=4*(heaviside(1-t)-heaviside(-1-t));
subplot(211)
ezplot(x,[-4 4])
fx=fourier(x)
subplot(212)
ezplot(fx,[-6 6]);

% different pulse width and period
syms t w
T=0.1;
x1=4*(heaviside(T-t)-heaviside(-T-t));
%figure(2)
subplot(211)
ezplot(x1,[-1 1])
%title('x2=rect(t/0.2)')
fx1=fourier(x1)
subplot(212)
ezplot(fx1,[-100 100]);
%title('FT of rect(t/0.2)')


