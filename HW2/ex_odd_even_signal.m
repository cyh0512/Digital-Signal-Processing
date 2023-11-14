%using sin and cos to illustrate odd and even number
t=-2:0.01:2;
y_o=sin(2*pi*2*t);
y_e=cos(2*pi*3*t);
y=y_o+y_e;%simulation signal with even and odd numbers

%time reversal ofthe signal
y_r=y(length(y):-1:1);
% even signal=(y+y_r)/2 
% even signal=(y-y_r)/2 
y_e1=(y+y_r)/2;
y_o1=(y-y_r)/2;

subplot(221);
%plot(t,y_o)
%plot(t,y_e)
plot(t,y);
subplot(222);
plot(t,y_r);
subplot(223);
plot(t,y_e1);
subplot(224);
plot(t,y_o1);


%any signal
y_t=2*rand(1,10);
y1=y_t(length(y_t):-1:1);
y_e=[y1 y_t];

y_t1=rand(1,10)-0.5;
y2=y_t1(length(y_t1):-1:1);
y_o=[-1*y2 y_t1];
y=y_o+y_e; %simulation of y=summation of odd and even signals
t=(1:length(y))-length(y)/2;


y_r=y(length(y):-1:1);
y_e1=(y+y_r)/2;
y_o1=(y-y_r)/2;
figure
subplot(221);
plot(t,y); hold on
plot(t,y_e,'r',t,y_o,'g');
subplot(222);
plot(t,y_r);hold on
plot(t,zeros(size(t)));
plot([0 0], [min(y_r) max(y_r)]);
subplot(223);
plot(t,y_e1);
subplot(224);
plot(t,y_o1);


