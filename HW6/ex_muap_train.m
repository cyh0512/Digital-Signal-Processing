load muap_temp; 
plot(muap_temp)
muap=muap_temp(1:100);
%plot(muap)
imp=[1 zeros(1,199)];
i=[imp imp imp imp imp imp imp imp imp imp imp imp];
%plot(i)
muap_train=conv(muap,i);
subplot(311);plot(muap);
subplot(312);plot(i);
subplot(313);plot(muap_train);

figure
fs=1000;
t=(1:length(muap))/fs;
y=muap;
[Pyy_1]=fft_basics(t,y);

figure
fs=1000;
t=(1:length(muap_train))/fs;
y=muap_train;
[Pyy_1]=fft_basics(t,y);