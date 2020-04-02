%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Zhengzhong Huang, 2020
% The version of Matlab for this code is R2016b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [out] = supportPro2()
N=1200;
out = zeros(N,N);
a = 8;  % ellipse major axis in pixels
b = 8;   % ellipse minor axis in pixels
x0 = 0; % x-coordinate of the support center
y0 = 0;  % y-coordinate of the support center
u=floor(N/2);
v=floor(N/2);

out(u-4:u+4,v-4:v+4)=1;
out(u-4,v-4)=0;
out(u-4,v+4)=0;
out(u+4,v-4)=0;
out(u+4,v+4)=0;
%{
for ii=1:N
    for jj=1:N
        x = ii-N/2 - x0;
        y = jj-N/2 - y0;
        if (((x/a)^2+(y/b)^2) < 1)
            out(ii,jj)=1;
        end
    end
end
%}


