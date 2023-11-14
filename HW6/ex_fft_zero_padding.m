%clear
%close all
% Fouries Series

figure
fs=100;
%t=0:1/fs:0.25-(1./fs);
%f0=10.2;
f0=10.5;
%f0=10;
% amp=3.5;
% t=0:1/fs:1-(1./fs);
% y=amp*cos(2*pi*f0*t)+sin(2*pi*25*t);
amp=0.11;
fm=5;
fc=250;
%y=(1+amp*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
y=(1+amp*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
%y=amp*cos(2*pi*f0*t)+4.5*cos(2*pi*40*t)+cos(2*pi*35*t);
%y=[y0 zeros(1,200)];
t=(1:length(y))/fs;
[Pyy_1]=fft_basics(t,y);

%increase the data length
figure
fs=100;
f0=10.5;
%f0=10;
amp=3.5;
t=0:1/fs:1-(1./fs);
y=amp*cos(2*pi*f0*t)+sin(2*pi*25*t);
%y=amp*cos(2*pi*f0*t)+4.5*cos(2*pi*40*t)+cos(2*pi*35*t);
y0=y;
y=[y0 zeros(1,length(t))];
t=(1:length(y))/fs;
[Pyy_1]=fft_basics(t,y);
fd=fs/length(y);

% longer data
figure
fs=100;
f0=10.5;
%f0=10;
amp=3.5;
t=0:1/fs:2-(1./fs);
y=amp*cos(2*pi*f0*t)+sin(2*pi*25*t);
t=(1:length(y))/fs;
[Pyy_1]=fft_basics(t,y);

%amplitude normalization for zero padding
figure
fs=100;
f0=10.5;
%f0=10;
amp=3.5;
t=0:1/fs:1-(1./fs);
y=amp*cos(2*pi*f0*t)+sin(2*pi*12*t);
z=zeros(1,100);
y_z=[y z];
t=(1:length(y_z))/fs;
%amplitude during zero_padding
y_z=y_z*(length(y_z)/length(y));
[Pyy_1]=fft_basics(t,y_z);


% fourier transform
%for zero padding
%Pyy=fft(y,1000);
% (1)call fft
figure
fs=200;
f0=10.5;
%f0=10;
amp=3.5;
t=0:1/fs:1-(1./fs);
y=amp*cos(2*pi*f0*t)+sin(2*pi*12*t);
%applying windowing function
w1 = window(@hamming,length(y));
y=(y.*w1')/mean(w1);
y_z=[y zeros(1,200)];
t=(1:length(y_z))/fs;

Pyy=fft(y_z);
len=length(abs(Pyy));
fd=fs/len;
%(2)frequency scaling
f = 0: fd:(len-1)*fs/len;
%(3)amplitude normalization
%Pyy1=abs(Pyy)*2/length(y_z);
Pyy1=abs(Pyy)*2/length(y);
subplot(211);plot(t,y_z);title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);

% (4)plot half of samplng frequency
subplot(212); plot(f(1:len/2),abs(Pyy1(1:len/2)));
% find the peak frequency
[p i]=max(Pyy1(1:len/2));
text(1.2*f(i), 0.9*p,['f =' num2str(f(i)) '  amp=' num2str(p)]); 