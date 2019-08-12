% Example_3cr_line_save_50.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% s3cr_50_pt.mat, Rs3cr_50_pt.mat,
% which will be used by the MATLAB file:
% Example_3cr_line_plot_50.m
% to plot Figure 15 (right) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0, theta_1 and theta_2
% here theta_1=pi/2, theta_2=0 (the canonical domain is the unit disk with 
% one circular slit and one radial slit
%
thetak = [pi/2;pi/2;0];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the circle: |z|=3
et(1+(k-1)*n:k*n,1)  =  3.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  3i.*exp(i.*t);
k  =  2; % the inner circle: |z-1.5|=1
et(1+(k-1)*n:k*n,1)  =  1.5+1.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =     -1i.*exp(-i.*t);
k  =  3; % the inner circle: |z+1.5|=1
et(1+(k-1)*n:k*n,1)  = -1.5+1.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =     -1i.*exp(-i.*t);
%
% generat a discretization of intervals: (-3,3)\([-2.5,-0.5]U[0.5,2.5])
s=-3:0.001:3;
s(abs(s)>=3)     = NaN;
s(abs(s-1.5)<=1) = NaN;
s(abs(s+1.5)<=1) = NaN;
sum(sum(abs(s)>=0))
% 
% 
% computing the values of Compute Mityuk's radius R(G,alpha) where alpha is
% the vector of discretization points
for k=1:length(s)
    if abs(s(k))>=0
        tic
        R(k)  =  Mityuk(et,etp,n,thetak,s(k));
        toc
    else
        R(k)  =  NaN;
    end        
end
% 
% save the data
save('s3cr_50_pt.mat', 's', '-ascii', '-double')
save('Rs3cr_50_pt.mat', 'R', '-ascii', '-double')
%