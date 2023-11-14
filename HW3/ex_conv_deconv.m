y=conv([3 -5 0 2], [1 1])
y1=deconv([3 -2 -5 2 2], [1 1])

b=[1 0 0];
a=[1 -1.5 0.5];
[r p k]= residue(b,a);
% double roots
%H(z)= (z-1)/(z^2+4z+4)
% 1/(z-2)- 3/(z-2)^2
b=[1 -1];
a=[1 4 4];
[r p k]= residue(b,a);
%H(z)=1/(z^2-3.5z+1.5)
% H(z)=0.4/(z-3) - 0.4/(z-0.5)
b=[1];
a=[1 -3.5 1.5];
[r p k]= residue(b,a);

