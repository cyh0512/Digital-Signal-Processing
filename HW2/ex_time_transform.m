%textbook example 2.1
y=[0 -1 -1 0 1 0];
t=[-1 -1 0 0 2 2];
%y=[0 -1 1 ];
%t=[-1 0  2];

plot(t,y)
%axis([-2 4 -2 2])

% Daw a line as x-axis
x_axis_t=-5:0.5:5;
x_axis_y=zeros(length(x_axis_t));
hold on
plot(x_axis_t, x_axis_y);

% Daw a line as y-axis
y_axis_y=-2:0.5:2; %range of y-axis
y_axis_t=zeros(length(y_axis_y));
hold on
plot(y_axis_t, y_axis_y);

% time-reverse
figure(2)
y=[0 -1 -1 0 1 0];
t=[-1 -1 0 0 2 2];
%reverse the time
t1=-1*t;
plot(t1,y)
hold on
plot(x_axis_t, x_axis_y);
plot(y_axis_t, y_axis_y);

%time scaing
figure(3)
y=[0 -1 -1 0 1 0];
t=[-1 -1 0 0 2 2];
%reverse the time
t2=0.5*t;
plot(t2,y)
hold on
plot(x_axis_t, x_axis_y);
plot(y_axis_t, y_axis_y);

%time shifting
figure(4)
y=[0 -1 -1 0 1 0];
t=[-1 -1 0 0 2 2];
%reverse the time
t3=t+2;
plot(t3,y)
hold on
plot(x_axis_t, x_axis_y);
plot(y_axis_t, y_axis_y);

t4=t-3;
plot(t4,y)
hold on
plot(x_axis_t, x_axis_y);
plot(y_axis_t, y_axis_y);

% time transform t1=1-(t/2)
figure(5)
t5=-2*t;
plot(t5,y,'r')
hold on
t6=2-2*t;
plot(t6,y)

hold on
plot(x_axis_t, x_axis_y);
plot(y_axis_t, y_axis_y);
