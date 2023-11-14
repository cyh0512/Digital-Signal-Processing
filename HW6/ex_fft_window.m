% --------- Windowing function ----------------
%%
figure
fs=100;
time_len=2; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=10;
amp=0.11;
fm=5;
fc=250;
%y=(1+amp*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
y=(1+amp*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
%y=amp*cos(2*pi*f0*t-0.312*pi);
%y=randn(size(y));
fd=fs/length(t)
%w1 = window(@rectwin,length(y));
w1 = window(@hamming,length(y));
%w1 = window(@blackman,length(y));
%w1 = window(@kaiser,length(y), 3);
y_w=y.*w1';

[Pyy_w]=fft_basics(t,y_w);
subplot(111);
hold on
plot(t,w1,'r')


Pyy_amp=2*Pyy_w/length(Pyy_w);
% amplitude normalization after windowing
amp_factor=sum(w1)/length(w1);
%norm_Pyy_amp=max(abs(Pyy_amp))/amp_factor
Pyy_amp=Pyy_amp./amp_factor;
len=length(abs(Pyy_amp));
f = 0: fd:(len-1)*fs/len;
figure;
subplot(312); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold on;
[p i] = max(abs(Pyy_amp(1:len/2)));
plot(f(i),abs(Pyy_amp(i)),' rx' );
title ( [' amp =  ',  num2str(abs(Pyy_amp(i))) ',   at freq. =' num2str(f(i))  ' Hz'] );

figure
[Pyy]=fft_basics(t,y);

%comparison between windows
%figure
[Pyy]=fft_basics(t,y_w);
Pyy=2*Pyy_w/length(Pyy);
plot(f(1:len/2),abs(Pyy_amp(1:len/2)), 'r');hold on;
plot(f(1:len/2),abs(Pyy(1:len/2)));

figure
semilogy(f(1:len/2),abs(Pyy_amp(1:len/2)), 'r');hold on;
semilogy(f(1:len/2),abs(Pyy(1:len/2)));


