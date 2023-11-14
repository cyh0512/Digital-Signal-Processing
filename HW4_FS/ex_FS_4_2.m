syms C1 ker t
w0=2*pi;
k=1;
%k=3;
ker=exp(-j*k*w0*t);
C1=int(ker,0,0.5)+int(-ker, 0.5, 1);
abs(C1)
angle(C1)*180/pi

c1=double(C1)
abs(c1)
angle(c1)

% first 5 harmonics
for k=1:5
ker=exp(-j*k*w0*t);
C1=int(ker,0,0.5)+int(-ker, 0.5, 1);
C(k)=2*double(C1);
end
subplot(311);stem(2*abs(C));
subplot(312);stem(angle(C)*180/pi);


square_wave=0;
t=0:0.01:5;
for n=1:length(C)
%    square_wave=square_wave+abs(C(n))*sin(2*pi*n*t);
%    square_wave=square_wave+abs(C(n))*sin(2*pi*n*t);
    square_wave=square_wave+real(C(n))*cos(2*pi*n*t)-imag(C(n))*sin(2*pi*n*t);
end
subplot(313);plot(t,square_wave);


syms C1 ker t
w0=2*pi;
% first 100 harmonics
for k=1:100
ker=exp(-j*k*w0*t);
C1=int(ker,0,0.5)+int(-ker, 0.5, 1);
C(k)=2*double(C1);
end
figure
subplot(211);stem(2*abs(C));

square_wave=0;
t=0:0.01:5;
for n=1:length(C)
%    square_wave=square_wave+abs(C(n))*sin(2*pi*n*t);
    square_wave=square_wave+real(C(n))*cos(2*pi*n*t)-imag(C(n))*sin(2*pi*n*t);

end
subplot(212);plot(t,square_wave);



%triangular function
syms C1 ker t
t=0:0.01:5;
ker=exp(-j*k*w0*t);
y=2*t*ker,0,0.5+int(-2*(1-t)*ker, 0.5, 1);

w0=2*pi;
% first 5 harmonics
for k=1:5
ker=exp(-j*k*w0*t);
C1=int(2*t*ker,0,0.5)+int(-2*(1-t)*ker, 0.5, 1);
C(k)=double(C1);
end
figure
subplot(311);stem(2*abs(C));
subplot(312);stem(angle(C));
square_wave=0;

t=0:0.01:5;
for n=1:length(C)
    %maynot be correct
%    square_wave=square_wave+abs(C(n))*sin(2*pi*n*t);
    square_wave=square_wave+real(C(n))*cos(2*pi*n*t)-imag(C(n))*sin(2*pi*n*t);

end
subplot(313);plot(t,square_wave);
