fs=100;
t=0:1/fs:1-(1./fs);

%t=0:1/fs:0.25-(1./fs);
%t=0:1/fs:0.5-(1./fs);
f0=10;
n_amp=0;
%y=amp*cos(2*pi*f0*t+0.3*pi)+cos(2*pi*15*t+0.3*pi)+1*sin(2*pi*5*t)+1*cos(2*pi*2*t+0.3*pi)+n_amp*randn(1,length(t)) ;
y=amp*sin(2*pi*f0*t+0.0*pi)+sin(2*pi*15*t+0.0*pi)+1*sin(2*pi*5*t)+1*sin(2*pi*2*t+0.0*pi)+n_amp*randn(1,length(t)) ;
%y=amp*cos(2*pi*f0*t+0.312*pi)+sin(2*pi*25*t)+0.2*randn(1,length(t)) ;
%y=amp*cos(2*pi*f0*t+0.312*pi)+sin(2*pi*25*t+0.32*pi) ;

%linear phase
wp=20/(fs/2);
a=1;
b=fir1(20,wp);
%y1=filter(b,a,y);
%IIR filter
[b a]=butter(4,wp);
y1=filtfilt(b,a,y);
y=y1;

Pyy=fft(y);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;


%amplitude normalization
Pyy_amp=abs(Pyy)*2/length(Pyy);
subplot(311);plot(t,y);title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);

% plot half of samplng freuency
subplot(312); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold;

i = find(abs(Pyy_amp(1:len/2)) > 0.1);
% find the peak frequency
plot(f(i),abs(Pyy_amp(i)),' rx' );
title ( [' amp =  ',  num2str(Pyy_amp(i)) ]  );
%[p i]=max(Pyy1(1:len/2));
%ext(1.2*f(i), 0.9*p,['f =' num2str(f(i)) '  amp=' num2str(p)]); 

%phase information
Pyy_ang=angle(Pyy);
%[p i]=max(abs(Pyy(1:len/2)));
subplot(313);plot(f(1:len/2), -1*Pyy_ang(1:len/2));

hold;plot(f(i),Pyy_ang(i),' rx' );
title ( [' angle =  ', num2str(Pyy_ang(i)/pi)]  ); 

figure(2)
[h w]=freqz(b,a,100);
subplot(211);plot(w*0.5*fs/pi, abs(h));
subplot(212);plot(w*0.5*fs/pi, angle(h));
figure(1)
subplot(313);hold on;plot(w*0.5*fs/pi, angle(h),'r');

