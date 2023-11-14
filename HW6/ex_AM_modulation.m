figure
fs=10000;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);f0=10;
amp=2;
f0=20;
fm=1000;
%y1=amp*sin(2*pi*f0*t-0.312*pi);
%y1=2+amp*sin(2*pi*f0*t);
y1=amp*sin(2*pi*f0*t);
y_carrier1=sin(2*pi*fm*t);
ym1=y1.*y_carrier1;
[Pyy_0]=fft_basics(t,ym1);

%demodulation of single signal
%demodulation process 1
ym=ym1;
ydm1=ym.*y_carrier1;
figure
[Pyy_1]=fft_basics(t,ydm1);


% 50 Hz signal, 2.2K modulation frequency
y2=cos(2*pi*50*t);
fm2=2200;
y_carrier2=sin(2*pi*fm2*t);
ym2=y2.*y_carrier2;
figure
[Pyy_1]=fft_basics(t,ym2);

%modulation of two signals at two modulated freq
figure
[Pyy_0]=fft_basics(t,y1+y2);
figure
[Pyy_1]=fft_basics(t,ym1+ym2);

%demodulation process 1
ym=ym1+ym2;
ydm1=ym.*y_carrier1;
figure
[Pyy_1]=fft_basics(t,ydm1);

%demodulation process 2
ydm2=ym.*y_carrier2;
figure
[Pyy_1]=fft_basics(t,ydm2);
