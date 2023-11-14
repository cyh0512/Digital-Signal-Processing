%Euler¡¦s equation defines e raised to an imaginary power in terms of
% sinusoidal function follows
% e^(-j*theta)= cos(theta) + jsin(theta)
% Create a two dimensional plot of this function as £c varies from 0 to 2£k.
% Create a three-dimensional line plot using plot3 as £c varies from 0 to 2£k
% (the three dimensions are real part of the expression, the imaginary part
% of the expression, and £cscalar
%theta=0.5*pi+0.25*pi;
theta=0.25*pi;
y =2*exp(j*theta);
y1 =2*( cos(theta) + j*sin(theta));
abs(y)
phase(y)*180/pi
%sqrt(real(a).^2+imag(a).^2)
%phase=atan(imag(y)/real(y))

% an array
t=0:0.01:2;
theta=2*pi*2*t-pi/4;
y=2.*exp(j*theta);
y_abs=abs(y);
y_phase=phase(y);
plot(t,real(y))

figure
subplot(211);plot(t,abs(y))
subplot(212);plot(t,phase(y))
%p1= abs(y).*exp(j*angle(y));
%theta = 0:pi./100:2*pi;
%x=exp(theta);
%x= cos(theta) + j*sin(theta);
%fprintf('The exponential is: %f',exp(-j*theta))
