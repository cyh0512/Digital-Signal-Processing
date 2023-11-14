
b0=[1 2 1];
a0=[1 -1 0.3561];
N=25;
Q=[];
b=b0;
a=a0;
for n=1:N
[q r]=deconv(b,a);
Q=[Q q];
b=[r(2:length(r)) 0];
end

[h w]=freqz(b0,a0);
figure
subplot(211);plot(w/(2*pi), abs(h));

[h1 w1]=freqz(Q,1);
subplot(212);plot(w1/(2*pi), abs(h1));
