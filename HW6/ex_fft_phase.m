close all
fs=100;
t=0:1/fs:1-(1./fs);
%t=0:1/fs:0.25-(1./fs);
%t=0:1/fs:0.5-(1./fs);
f0=10;
n_amp=0;
amp=3;
%y=amp*cos(2*pi*f0*t+0.3*pi)+cos(2*pi*15*t+0.3*pi)+1*sin(2*pi*5*t)+1*cos(2*pi*2*t+0.3*pi)+n_amp*randn(1,length(t)) ;
%y=amp*sin(2*pi*f0*t+0.0*pi)+sin(2*pi*15*t+0.0*pi)+1*sin(2*pi*5*t)+1*sin(2*pi*2*t+0.0*pi)+n_amp*randn(1,length(t)) ;
%y=amp*cos(2*pi*f0*t+0.312*pi)+sin(2*pi*25*t)+0.2*(rand(1,length(t))-0.5) ;
% with some noise
%y=amp*cos(2*pi*f0*t)+sin(2*pi*25*t) ; %two sinusoidlas without noise
y=amp*cos(2*pi*f0*t)+cos(2*pi*25*t+0.32*pi) ; %two sinusoidlas without noise
%y=amp*cos(2*pi*f0*t+0.312*pi)+sin(2*pi*25*t+0.32*pi) ; %two sinusoidlas without noise

% Apply window with amplitude normalization
%win=hamming(length(y));
%win=hanning(length(y));
%y=y.*win';
%y=y./mean(win);% ampitude normalization

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
subplot(313);plot(f(1:len/2), Pyy_ang(1:len/2));

hold;plot(f(i),Pyy_ang(i),' rx' );
title ( [' angle =  ', num2str(Pyy_ang(i)/pi)]  ); 


