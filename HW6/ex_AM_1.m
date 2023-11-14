figure
fs=1000;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);
amp=2;
f0=40;
fm=200;
y1=amp*(1+sin(2*pi*f0*t-0.312*pi));
y_carrier1=sin(2*pi*fm*t);
ym1=y1.*y_carrier1;

ym=ym1;
[Pyy_1]=fft_basics(t,ym);

figure
[Pyy_1]=fft_basics(t,y1);

ydm1=ym.*y_carrier1;
figure
[Pyy_1]=fft_basics(t,ydm1);
