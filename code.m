%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Zhengzhong Huang, 2020
% The version of Matlab for this code is R2016b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
close all;
clear all;

N1 = 1200;% initial number of pixels
M = 1200;% initial whole number of pixels
N = 1200;% final number of pixels

wavelength = 500*10^(-9);  % wavelength
range = 0.001;               % object area sidelength in meter
z = 0.0024;                 % Propagation distance
h0 = 0.001/(M/N);          % hologram sidelength in
h1 = 0.001/(M/N1);% 
prop = Propagator_function(M, z, wavelength, range);

%% Object generated
phase=phasePro2();% Phase of object
object0=objectPro2();% Amplitude of object
object=object0.*exp(1i.*phase);% Complex-value object
obj=crops(object,25,1200);
figure(3),imshow(angle(obj),[])

%% Hologram generated

U = IFT(FT(object).*prop);
hologram = abs(U).^2;% Hologram

%% Single aperture
hologram_cropped0=hologram(401:800,401:800);% Single aperture
prop0 = Propagator_function(400, z, wavelength, 0.001/(M/400));
recons0 = IFT(FT(sqrt(hologram_cropped0)).*conj(prop0));% reconstruction
rec0=crops(recons0,100,400);
figure(3),imshow(abs(hologram),[])
%% Multi-apertures

hologram_cropped1=ones(N1,N1);
hologram_cropped1(101:500,101:500) = hologram(101:500,101:500);
hologram_cropped1(101:500,701:1000) = hologram(101:500,701:1000);
hologram_cropped1(701:1100,101:500) = hologram(701:1100,101:500);
hologram_cropped1(701:1100,701:1100) = hologram(701:1100,701:1100);
prop1 = Propagator_function(N1, z, wavelength, h1);
recons1 = IFT(FT(sqrt(hologram_cropped1)).*conj(prop1));
rec1=crops(recons1,50,1200);
figure(3),imshow(angle(rec1),[])

%% Parameter setting

holo0=sqrt(hologram);
A = ones(N,N);% Amplitude in hologram plane
phase1 = zeros(N,N);% Phase in hologram plane
support0=supportPro2();% Support function
M1 = (N - N1)/2;
M2 = (N + N1)/2;

    
%%

Loops = 500; 
MSE=zeros(1,Loops);
for kk = 1:Loops

fprintf('Iteration: %d\n', kk)

A(101:500,101:500) = holo0(101:500,101:500);
A(101:500,701:1000) = holo0(101:500,701:1000);
A(701:1100,101:500) = holo0(701:1100,101:500);
A(701:1100,701:1100) = holo0(701:1100,701:1100);
%}
holo_field = A.*exp(1i.*phase1);
t1 = IFT((FT(holo_field)).*conj(prop));

object1 = 1 - abs(t1); % Object amplitude
ph1=angle(t1);% Object phase

for ii=1:N
    for jj=1:N
        if (object1(ii,jj)<0)
            object1(ii,jj)=0;
            ph1(ii,jj)=0;
        end
    end
end
object1 = object1.*support0;
t1 = (1 - object1).*exp(1i*ph1);
if kk==20
    t2=t1;%% 20 iterations
end

holo_field_updated = IFT((FT(t1)).*(prop));

A = abs(holo_field_updated);% Undated amplitude in hologram plane
phase1 = angle(holo_field_updated);% Undated phase in hologram plane

end

t11=crops(t1,50,1200);
figure(3),imshow(angle(t11),[])






