figure
fs=1000;
f0=10;
time_len=2; %1 second of data
t=0:1/fs:time_len-(1./fs);
amp=3.5;
y=amp*sin(2*pi*f0.*t.*t);
[Pyy_1]=fft_basics(t,y);

% flip the data
figure
n=length(y):-1:1;
y_r=y(n);
[Pyy_1]=fft_basics(t,y_r);




Pyy=fft(y);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
Pyy_ang=angle(Pyy);
subplot(311);plot(t,y);
%title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% plot half of samplng freuency
subplot(312); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold on;
subplot(313);plot(f(1:len/2), Pyy_ang(1:len/2));

