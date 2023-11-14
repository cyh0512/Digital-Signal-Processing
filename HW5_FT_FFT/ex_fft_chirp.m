clear
close all
fs=1000;
f0=10;
time_len=2; %1 second of data
t=0:1/fs:time_len-(1./fs);
amp=3.5;
y=amp*sin(2*pi*f0.*t.*t);
%y=amp*sin(2*pi*f0.*t);
%[Pyy_1]=fft_basics(t,y);

Pyy=fft(y);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
Pyy_ang=angle(Pyy);
subplot(411);plot(t,y);
%title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% plot half of samplng freuency
subplot(412); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold on;

% invers of sequence
y1=y(length(y):-1:1);
Pyy1=fft(y1);
Pyy1_amp=2*abs(Pyy1)/length(Pyy1);
subplot(413);plot(t,y1);
subplot(414); plot(f(1:len/2),abs(Pyy1_amp(1:len/2)));hold on;



%subplot(413);plot(f(1:len/2), Pyy_ang(1:len/2));
% short time fft
figure
fs=1000;
f0=10;
time_len=2; %1 second of data
t=0:1/fs:time_len-(1./fs);
amp=3.5;
y=amp*sin(2*pi*f0.*t.*t);
for n=1:9
    y0=y(1+(n-1)*200:n*200);
    Pyy=fft(y0);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
Pyy_ang=angle(Pyy);
subplot(910+n); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));
end

figure
y1=y(length(y):-1:1);
for n=1:9
    y0=y1(1+(n-1)*200:n*200);
    Pyy=fft(y0);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
Pyy_ang=angle(Pyy);
subplot(910+n); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));
end

    

