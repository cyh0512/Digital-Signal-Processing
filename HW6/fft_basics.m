function [Pyy]=fft_basics(t, y)

fs=1/(t(2)-t(1));
% amplitude 
Pyy=fft(y);
len=length(abs(Pyy));
fd=fs/len;
f = 0: fd:(len-1)*fs/len;
%amplitude normalization
Pyy_amp=2*abs(Pyy)/length(Pyy);
subplot(111);
plot(t,y);
% %title(['f= ' num2str(f0) '  amp. of sinusoidal=  '  num2str(amp)]);
% % plot half of samplng freuency
% subplot(312); plot(f(1:len/2),abs(Pyy_amp(1:len/2)));hold on;
% 
% % find the peak frequency
% [p i] = max(abs(Pyy_amp(1:len/2)));
% plot(f(i),abs(Pyy_amp(i)),' rx' );
% title ( [' amp =  ',  num2str(Pyy_amp(i)) ',   at freq. =' num2str(f(i))  ' Hz'] );
% 
% %phase information
% Pyy_ang=angle(Pyy);
% %[p i]=max(abs(Pyy(1:len/2)));
% subplot(313);plot(f(1:len/2), Pyy_ang(1:len/2));
% hold;plot(f(i),Pyy_ang(i),' rx' );
% title ( [' angle =  ', num2str(Pyy_ang(i)/pi)]  ); 