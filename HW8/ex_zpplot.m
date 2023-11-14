
z=0.5;
p=0.7*exp(j*2*pi*[-1/3 1/3]')
zplane(z,p)


z=0.5;
p=1.0*exp(j*2*pi*[-1/6 1/6]')
zplane(z,p)

% plot signal

b=[1 0 -1];
a=[1 -1.0605 0.5625];
z=roots(b);
p=roots(a);
zplane(z,p)
[h w]=freqz(b,a);
figure
subplot(211);plot(w/(2*pi), abs(h));
subplot(212);plot(w/(2*pi), angle(h));
%verfication purpose
b1=conv([1 -z(1)], [1 -z(2)]);
a1=conv([1 -p(1)], [1 -p(2)]);

%change the magniture
figure
b=[1 0 -1];
a=[1 -1.0605 0.5625];
z=roots(b);
p=roots(a);
z1=z;
%p=1.0*exp(j*2*pi*[-1/6 1/6]')
p1=0.95*exp(j*angle(p))
zplane(z1,p1)
b2=conv([1 -z1(1)], [1 -z1(2)]);
a2=conv([1 -p1(1)], [1 -p1(2)]);
[h2 w2]=freqz(b2,a2);
figure
subplot(211);plot(w2/(2*pi), abs(h2));
subplot(212);plot(w2/(2*pi), angle(h2));

%Calculate sigle frequency response in H(z)
fs=100;
n=0:1/fs:0.5-1/fs;
omega=2*pi*n;
z=exp(j*omega);
b=1-z.^(-2);
a=1-1.0605*z.^(-1)+0.5625*z.^(-2);
%b=z.^(2)-1;
%a=z.^(2)-1.0605*z.^(1)+0.5625;
h1=b./a;
%
figure
subplot(211);plot(n, abs(h1)); hold on
subplot(212);plot(n, atan(imag(h1)./real(h1))); hold on
subplot(211);plot(w/(2*pi), abs(h),'r');
subplot(212);plot(w/(2*pi), angle(h),'r');

b=[1 0 -1];
a=[1 -1.0605 0.5625];
fs=100;
n=0:1/fs:0.5-1/fs;
omega=2*pi*n;
z=exp(j*omega);
h2=polyval(b,z)./polyval(a,z);
subplot(211);plot(n, abs(h2)); hold on
subplot(212);plot(n, atan(imag(h2)./real(h2))); hold on



b=[1 0 0 0 -1];
a=1;
p=roots(a);
z=roots(b);
subplot(211);
zplane(z,p)
[h w]=freqz(b,a);
subplot(212);plot(w/(2*pi), abs(h));
%subplot(212);plot(w/(2*pi), angle(h));

b=[1 0 0 0 1];
a=1;
p=roots(a);
z=roots(b);
subplot(211);
zplane(z,p)
[h w]=freqz(b,a);
subplot(212);plot(w/(2*pi), abs(h));





