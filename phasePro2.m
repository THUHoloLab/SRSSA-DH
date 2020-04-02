%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Zhengzhong Huang, 2020
% The version of Matlab for this code is R2016b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [out] = phasePro2()
N0 = 600;                  % initial number of pixels
M = 1200;
N = 1000;        
out = zeros(M,M);  
u=M/2;
v=M/2;
x1=0;
y1=0;
a=1;b=1;

out(u-2,v-2:v+2)=0.5;
out(u,v-2:v+2)=0.5;
out(u+2,v-2:v+2)=0.5;

%{
for ii=1:M
    for jj=1:M
        x = ii-M/2 - x1;
        y = jj-M/2 - y1;
        if (((x/a)^2+(y/b)^2) < 36)&&(((x/a)^2+(y/b)^2) >= 25)
            out(ii,jj)=0.5;
        end
    end
end

out(u,v)=0.5;
%}




