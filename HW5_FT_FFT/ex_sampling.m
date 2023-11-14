fs=100;
f=5;
t=0:1/fs:1;
y=cos(2*pi*f*t);
subplot(211);plot(t,y), hold on;
subplot(211);plot(t,y,'rx'), hold on;

fs=1000;
f=90;
t=0:1/fs:1;
y3=cos(2*pi*f*t);
subplot(212);plot(t,y3,'r'), hold on;



fs=100;
f=95;
t=0:1/fs:1;
ys=cos(2*pi*f*t);
subplot(212);plot(t,ys), hold on;
subplot(212);plot(t,ys,'rx'), hold on;

fs=100;
f=5;
t=0:1/fs:1-1/fs;
ys1=sin(2*pi*f*t);
subplot(212);plot(t,ys1,'r'), hold on;

%too low in the sampling frequency
fs=100;
f=95;
t=0:1/fs:1-1/fs;
y=sin(2*pi*f*t);
[Pyy_1]=fft_basics(t,y);

figure
fs1=10;
f=9;
t1=0:1/fs1:1-1/fs1;
y1=sin(2*pi*f*t1);
[Pyy_1]=fft_basics(t1,y1);


%sample a too high frequency
f2=98;
t2=0:1/fs:1;
y2=sin(2*pi*f2*t);
subplot(212);plot(t,y,t2,y2,'rx',t2,y2,'r');




