clc;
clear;
close all;
fs=60000;
t=0:1/fs:1;
fm=500;
fc=25000;
Ac=1;
Am=0.4;
s= Ac*(1 + Am*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
figure(1)
plot(t,s);

figure(2)
N=length(s);
y_fft=abs(fft(s));
y_fft_norm=2*y_fft/length(y_fft);
faxis=fs/2*linspace(0,1,N/2+1);
plot(faxis,y_fft_norm(1:N/2+1));

% ffts=abs(fft(s));
% figure(2)
% plot(fs/2*linspace(0,1,5000),ffts(1:5000));
%%
s= Ac*(1 + Am*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
s=[zeros(1,30000),s,zeros(1,30000)];
figure(3)
plot(linspace(0,1,120001),s);
ffts=abs(fft(s));
amp=2*ffts/length(ffts);
figure(4)
plot(fs/2*linspace(0,1,60001),abs(amp(1:60001)));

