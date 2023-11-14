%example for long division
%input: b/a for N term
%output: Q:quotients
%		   r:remainder
%exmple: b=[1 2 1];a=[1 -1 0.3561];N=5;
%[Q r]=long_div(b,a,N)
function [Q, r]=long_div(b,a,N)
Q=[];
for n=1:N
[q r]=deconv(b,a);
Q=[Q q];
%no remainder
if (r==0) break;
   end
b=[r(2:length(r)) 0];
end
