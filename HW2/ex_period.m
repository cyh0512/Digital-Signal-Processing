%lcm(2,3) only good for 2 integer
a=sym([2*pi/3.5 pi pi*12/7])
%a=sym([2/3.5 1 12/7])
%a=sym([1/3.5 1/2 6/7])
period=lcm(a)

%plotting
%t=0:0.01:60;
t=0:0.01:80;
f1=1./eval(a);
2*pi*f1 %check as equations
y=cos(2*pi*f1(1)*t)+1.5*sin(2*pi*f1(2)*t)+2*cos(2*pi*f1(3)*t);
plot(t,y);
hold on

%plot period vertical line
%plot(12*pi*ones(1,9), -4:4,'r')
py = min(y)-0.5:0.1:max(y)+0.5;
px=period*ones(1,length(py));
plot(px,py,'r');
px=2*period*ones(1,length(py));
plot(px,py,'r');


%aperiodic function
a2=sym([2*pi/3.5 pi pi*12/7 2/5])
period=lcm(a2)

%plotting
t=0:0.01:60;
t=0:0.01:80;
f1=1./eval(a2);
2*pi*f1 %check as equations
y=cos(2*pi*f1(1)*t)+1.5*sin(2*pi*f1(2)*t)+2*cos(2*pi*f1(3)*t)+cos(2*pi*f1(4)*t);
plot(t,y);
