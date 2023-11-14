%%
%% Generate a simulated signal
%%
N = 100; %% Number of time-samples in the signal
%t=1:128;
f=100;
t=0:1/f:1-1/f;
x=sin(2*pi*5*t)+cos(2*pi*30*t);
x = rand(1,N)-0.5; %% This is white noise
figure(1); plot(x); title('Original signal');
xlabel('Time (seconds)');


%%
%% Calculate the Fourier transform of the signal
%% and filter it with a lowpass filter
%%
BW = 20; %% Bandwidth of the filter

X = fftshift(fft(x));
K = zeros(1,length(t)); K(floor(N/2)+1+[-BW:BW])=1; %% Lowpass filter
X1 = X .* K; %% Lowpassed signal
F = -floor(N/2):(ceil(N/2)-1); %% Frequencies in Ft
figure(2);
subplot(3,1,1); plot(F,abs(X)); title('Fourier power spectrum of signal x');
subplot(3,1,2); plot(F,K); title('K: lowpass filter');
subplot(3,1,3); plot(F,abs(X1)); title('Fourier power spectrum of lowpass filtered signal');
xlabel('Frequency (Hz)');

%%
%% Return to time domain and look at lowpassed filtered signal
%%
x1 = ifft(ifftshift(X1));
figure(3);
subplot(2,1,1); plot(t,x,'c');
hold on; plot(t,real(x1),'b','LineWidth',3); hold off
title('Comparison of original signal x and lowpassed filtered version x1');
subplot(2,1,2); plot(t,imag(x1)); 
hold on; plot([1 N],[eps eps],'g'); hold off; 
title('Comparison of imaginary part of inverse Fourier transform and constant eps');
xlabel('Time (seconds)');
