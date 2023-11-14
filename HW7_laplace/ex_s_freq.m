n=[3 1];
d=[1 2 5];
bode(n, d);
%[mag phase]=bode(n, d, {0.1 100});
figure
f=0.01:0.01:100;
h=freqs(n, d, f);
subplot(211);semilogx(f,10*log(abs(h)))
subplot(212);semilogx(f,180*angle(h)/pi)
figure
subplot(211);plot(f,abs(h))
subplot(212);plot(f,180*angle(h)/pi)


%step response 7.19
n=[3 1]
d=[1 2 5]
step(n,d)

n=[3 1]
d=[1 2 5 0]
[r p k]= residue(n, d)

