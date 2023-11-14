fs=10000;
t=0:.1/fs:1.1;
y=sawtooth(2*pi*2*t);
plot(t,y);

y2=sawtooth(t,0.5);
