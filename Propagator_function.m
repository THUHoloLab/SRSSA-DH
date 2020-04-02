%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Zhengzhong Huang, 2020
% The version of Matlab for this code is R2016b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [u] = Propagator_function(N0, z, lambda, screen)

u = zeros(N0,N0);
for ii = 1:N0; 
    for jj = 1:N0
        a = lambda*(ii-N0/2-1)/screen;
        b = lambda*(jj-N0/2-1)/screen;
        if ((a^2 + b^2)<=1)
        u(ii,jj) = exp(-2*pi*1i*z*sqrt(1 - a^2 - b^2)/lambda);
        end;
    end
end;
