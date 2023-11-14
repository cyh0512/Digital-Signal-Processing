clf
fs=200;
t=0:1/fs:1-(1./fs);
f0=15;
%f0=70;
amp=2.7;
%y=amp*sin(2*pi*f0*t);
%y=amp*cos(2*pi*f0*t);
y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*30*t)+2*sin(2*pi*42*t);
%y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*8*t)+1.5*sin(2*pi*125*t);
%y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*8*t)+1.5*sin(2*pi*125*t);
%y=amp*cos(2*pi*f0*t)+cos(2*pi*17.5*t);
%y=amp*cos(2*pi*f0*t-0.2*pi);
%y=amp*cos(2*pi*f0*t)+100;


% amplitude 
Pyy=fft(y);
len=length(y);
%len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
%Pyy_amp=abs(Pyy)/length(Pyy);

Pyy_amp=2*abs(Pyy)/length(Pyy);

subplot(311);plot(t,y);title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% plot half of samplng freuency
subplot(312); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold;

% find the peak frequency
i = find(abs(Pyy_amp(1:len/2)) > 0.1);
plot(f(i),abs(Pyy_amp(i)),' rx' );
title ( [' amp =  ',  num2str(Pyy_amp(i)) ]  );

%phase information
Pyy_ang=angle(Pyy);
%[p i]=max(abs(Pyy(1:len/2)));
subplot(313);plot(f(1:len/2), Pyy_ang(1:len/2));
hold;plot(f(i),Pyy_ang(i),' rx' );
title ( [' angle =  ', num2str(Pyy_ang(i)/pi)]  ); 
fd=fs/length(t)

y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*10*t)+sin(2*pi*22*t);
%y=amp*cos(2*pi*f0*t-0.2*pi);
%y=amp*cos(2*pi*f0*t)+100;
%y=amp*sin(2*pi*f0*t);


% amplitude 
Pyy=fft(y);
len=length(y);
%len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=abs(Pyy)/length(Pyy);

Pyy_amp=2*abs(Pyy)/length(Pyy);

%test sampling frequency
fs=100;
t=0:1/fs:1-(1./fs);
f0=15
%f0=70;
amp=2.7;
y=sin(2*pi*5*t) + amp*sin(2*pi*f0*t);
%y=amp*sin(2*pi*f0*t);
figure
subplot(311);plot(t,y);title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% plot half of samplng freuency
Pyy=fft(y);
len=length(y);
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
subplot(312); plot(f(1:len),abs(Pyy_amp(1:len)));hold;
subplot(313); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold;

%test frequency resolution
fs=100;
t=0:1/fs:10-(1./fs);
%f0=15
f0=15
%f0=70;
amp=3;
y=sin(2*pi*22*t) + amp*sin(2*pi*f0*t);
%y=amp*sin(2*pi*f0*t);
%figure
subplot(311);plot(t,y);title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% plot half of samplng freuency
Pyy=fft(y);
len=length(y);
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
subplot(312); plot(f(1:len),abs(Pyy_amp(1:len)));hold;
subplot(313); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold;



% Use fft_basics
figure
fs=100;
time_len=1; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=15;
amp=3.5;
%y=amp*cos(2*pi*f0*t-0.2*pi)+cos(2*pi*22*t)+1.5*sin(2*pi*30*t);
y=amp*cos(2*pi*f0*t-0.2*pi);
[Pyy_1]=fft_basics(t,y);


% ---- test frequency resolution ----
figure
fs=100;
time_len=20; %1 second of data
t=0:1/fs:time_len-(1./fs);
f0=15.75;
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
%y=y+30; % add baseline
y=y+t*30; % add linear trend
fd=fs/length(t)
y1=y;
%remove the baselne
%y1=y-mean(y);
%y1=detrend(y);
[Pyy_1]=fft_basics(t,y1);
subplot(311);hold on
plot(t,y,'r')



