n=[3 1];
d1=[1 2 5];
d2=[1 3];
d=conv(d1, d2)
[r p k]= residue(n, d)

k1_mag=abs(r(3))
k1_phase=angle(r(3))

k2_mag=abs(r(2))
k2_phase=angle(r(2))

% Using inverse laplace
syms s n1 d1 n2 d2  a b
ilaplace(1/(s-1))
ilaplace(1/(s-a+b*j))

n1=0.5-0.25i;
n2=0.5+0.25i;
d1=s+1-2i;
d2=s+1+2i;

f=n1/d1+n2/d2;
ilaplace(f)
angle(n1)*180/pi
angle(n2)*180/pi

%example 7.16 double roots
n=[4 4 4]
d=[1 3 2 0 0]
[r p k]= residue(n, d)
% r= -3     4    -1     2
% p=  -2   -1     0     0
