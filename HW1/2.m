clc;
clear;
close all;
fs=20000;
load('nts_bp.mat');
t=0:1:300000-1;
figure;
plot(t*1/fs,nts_bp');
temp=nts_bp(38501:42000);
temp=temp';
%figure;
%plot(temp);

%%
bt=length(findpeaks(nts_bp,'MinPeakDistance',3000));
HR=340;
num=floor(HR/4);
imp=[];
for n=0:bt;
       imp(1,length(temp)*n+1)=1;
end
mr=1.1;
%figure;
imp=imp+0.04*(imp.*sin(pi/1.5+2*pi*0.04*linspace(0,15,length(imp))));
imp=imp+0.01*(imp.*sin(2*pi*mr*linspace(0,15,length(imp))));
%plot(imp);
figure;
C=conv(imp,temp);
plot(C);
%%

