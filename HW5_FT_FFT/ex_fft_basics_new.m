
% Use fft_basics
figure
fs=100;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=15;
amp=3.5;
y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*22*t)+1.5*sin(2*pi*30*t);
%y=amp*cos(2*pi*f0*t-0.2*pi);
[Pyy_1]=fft_basics(t,y);


% ---- test frequency resolution ----
figure
fs=100;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=15;
amp=3.5;
y=amp*cos(2*pi*f0*t-0.312*pi)+1.5*sin(2*pi*22*t);
fd=fs/length(t)
[Pyy_1]=fft_basics(t,y);

%test trend
figure
fs=100;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=10;
amp=3.5;
%y=amp*cos(2*pi*f0*t-0.312*pi);
y=amp*cos(2*pi*f0*t);
y=y+10; % add baseline
%y=y+t*30; % add linear trend
fd=fs/length(t)
%remove the baselne
%y1=y-mean(y);
y1=detrend(y);
[Pyy_1]=fft_basics(t,y1);
subplot(311);hold on
plot(t,y,'r')



