%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Zhengzhong Huang, 2020
% The version of Matlab for this code is R2016b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [out] = objectPro2()
N0 = 600;                  % initial number of pixels
M = 1200;
N = 1000;      
u=floor(M/2);
v=floor(M/2);
out = ones(M,M);  
a=1;b=1;
x1=0;y1=0;

out(u-2,v-2:v+2)=0.2;
out(u,v-2:v+2)=0.2;
out(u+2,v-2:v+2)=0.2;
%}
%{
for ii=1:M
    for jj=1:M
        x = ii-M/2 - x1;
        y = jj-M/2 - y1;
        if (((x/a)^2+(y/b)^2) < 49)&&(((x/a)^2+(y/b)^2) >= 25)
            out(ii,jj)=0.2;
        end
    end
end

out(u,v)=0.2;
%}