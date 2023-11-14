%
%plot(hertz,abs(h))% concept of filtering
fs=100;
t=0:1/fs:3-1/fs;
y=sin(2*pi*3*t)+sin(2*pi*33*t);
%y=sin(2*pi*3*t)+1*sin(2*pi*33*t)+sin(2*pi*40*t)+sin(2*pi*20*t);
%y=sin(2*pi*10*t)+sin(2*pi*40*t);
y1=MA(y,3);
subplot(211);plot(t,y); hold on
subplot(212);plot(t(1:length(y1)),y1,'r')
[Pyy_1]=fft_basics(t,y);
figure
[Pyy_1]=fft_basics(t(1:length(y1)),y1);

%figure
%[b, a] = butter(4,20/50,'high');
%[b, a] = butter(4,10/50);
%a=1;
%b = fir1(40,20/50);
%b=[0.25 0.25 0.25 0.25];
%b=ones(1,4)/4;
%b=[1 -1];
%a=1
fs=100;
b=[1/3 1/3 1/3];
a=1;
[h w]=freqz(b, a, 100);
hertz = (w/pi)*(fs/2);;
figure
subplot(212);plot(hertz,abs(h)),title('Filter H1(z)');

%fs=100;
%t=0:1/fs:1-1/fs;
%y=sin(2*pi*3*t)+sin(2*pi*33*t);
%y=sin(2*pi*3*t)+sin(2*pi*33*t);

y1=filter(b,a,y);
%y2=filtfilt(b,a,y);
subplot(212);plot(t,y); hold on
plot(t, y1,'r'); 
%plot(t,y2,'r');
plot(t, sin(2*pi*3*t));

figure
fs_h=fs/2;
[h w]=freqz(b,a,100);
subplot(312);plot((w*fs_h)/pi,abs(h)),
xlabel('Norm. freq.'),ylabel('Magnitude'),grid;

% ------frquency analysis
len=length(y);
fd=fs/len;
f=0:fd:(len-1)*fs/len;

%amplitude normalization
Pyy1=2*fft(y)/length(y);
% plot half of samplng freuency
subplot(311); plot(f(1:len/2),abs(Pyy1(1:len/2)));
title('frequency spectrum before filtering');

%amplitude normalization
Pyy2=2*fft(y1)/length(y1);
% plot half of samplng freuency
subplot(313); plot(f(1:len/2),abs(Pyy2(1:len/2)));
title('frequency spectrum after filtering');
%zero-pole plot
figure;
zplane(roots(b),0);


%------------------------------------

b=[1 -1];
a=1;
y1=filter(b,a,y);
subplot(211);plot(t,y); hold on
subplot(212);plot(t, y1,'r')

%
plot(t,y);hold
plot(t,y_filt,'r')
title('filtering process')
%
figure
plot(t,y);hold
plot(t,y_conv(1:length(t)),'r');
title('convolution process')
% filtfilt to remove the edge effect
figure
y_filt2=filtfilt(b,1,y);
plot(t,y);hold
plot(t,y_filt2,'r');
title('filtfilt process')
%
fs_h=fs/2;
[h w]=freqz(b,1,100);
subplot(312);plot(w*fs_h/pi,abs(h)),
xlabel('Norm. freq.'),ylabel('Magnitude'),grid;

%frquency analysis
len=length(y);
fd=fs/len;
f=0:fd:(len-1)*fs/len;

%amplitude normalization
Pyy1=2*fft(y)/length(y);
% plot half of samplng freuency
subplot(311); plot(f(1:len/2),abs(Pyy1(1:len/2)));
title('frequency spectrum before filtering');

%amplitude normalization
Pyy2=2*fft(y_filt2)/length(y);
% plot half of samplng freuency
subplot(313); plot(f(1:len/2),abs(Pyy2(1:len/2)));
title('frequency spectrum after filtering');

figure
z=roots(b);
p=roots(1);
subplot(224);zplane(z,p) 