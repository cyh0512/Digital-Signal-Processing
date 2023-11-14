%plot(hertz,abs(h))% concept of filtering
fs=100;
t=0:1/fs:3-1/fs;
%y=sin(2*pi*3*t)+sin(2*pi*33*t);
%y=sin(2*pi*3*t)+sin(2*pi*33*t);
y=sin(2*pi*3*t)+sin(2*pi*33*t)+2*sin(2*pi*12*t);
%b=[0.25 0.5 0.25];
%a=1;

%y=y+(rand(1,length(y))-0.5);
% 
b=[0.33 0.33 0.33];
N=length(y);
y_ma=zeros(1,N);
y_ma(1)=b(3)*y(1);
y_ma(2)=b(2)*y(1)+b(3)*y(2);
for n=3:N
   y_ma(n)=b(3)*y(n-2)+b(2)*y(n-1)+b(1)*y(n);
%   y_ma(n)=sum(fliplr(b).*y(n-2:n));
end
[Pyy_1]=fft_basics(t,y);
figure
[Pyy_1]=fft_basics(t,y_ma);



%convolution
y_conv=conv(y,b);

% comparison among filter, MA, conv
y_filt=filter(b,1,y);
figure
[Pyy_1]=fft_basics(t,y_filt);

y_filt-y_ma;
y_filt-y_conv(1:length(y_filt));

%delay and filtfilt
a=1;
y2=filtfilt(b,a,y);
%plot(t,y);hold
plot(t, y_filt,'r'); hold on
plot(t,y2,'g');
plot(t, sin(2*pi*3*t));

%long delay
fs=100;
t=0:1/fs:3-1/fs;
y=sin(2*pi*3*t)+sin(2*pi*33*t);
b=fir1(51,0.2);
y_filt=filter(b,1,y);
figure
[Pyy_1]=fft_basics(t,y_filt);
a=1;
y2=filtfilt(b,a,y);
figure
[Pyy_1]=fft_basics(t,y_2);
figure
plot(t, y_filt,'r'); hold on
plot(t,y2,'g');
plot(t, sin(2*pi*3*t));


