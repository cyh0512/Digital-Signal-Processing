fs=100;
f=9;
t=0:1/fs:1;
y=sin(2*pi*f*t);
%too low in the sampling frequency
fs1=10;
t1=0:1/fs1:1;
y1=sin(2*pi*f*t1);
subplot(211);plot(t,y,t1,y1,'ro',t1,y1,'r');
%sample a too high frequency
f2=98;
t2=0:1/fs:1;
y2=sin(2*pi*f2*t);
subplot(212);plot(t,y,t2,y2,'rx',t2,y2,'r');




