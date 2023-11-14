% FFT in Matlab
clf
t=0:0.001:0.6;
x=2*sin(2*pi*25*t)+sin(2*pi*60*t)+sin(2*pi*750*t)+sin(2*pi*600*t);
y=x+2*randn(1,length(t));
subplot(211);
plot(y);

% normalized frequency
%Pn=abs(fft(x,512))*2/512;
Pn=abs(fft(x,1024))*2/length(x);
f=1000*(0:511)/1024;
subplot(211)
plot(f,Pn(1:512));

Y=fft(y,512);
Pyy=Y.*conj(Y)/512;
f=1000*(0:255)/512;
subplot(212)
plot(f,Pyy(1:256));
%clg




