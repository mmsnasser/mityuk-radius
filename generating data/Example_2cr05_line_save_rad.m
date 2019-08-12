% Example_2cr05_line_save_rad.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% s2cr05_0_pt.mat, Rs2cr05_0_pt.mat,
% which will be used by the MATLAB file:
% Example_2cr05_line_plot.m
% to plot Figure 5 (first row, right) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit
thetak = [pi/2;0];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
k  =  2; % the inner circle: |z-0.5|=0.25
et(1+(k-1)*n:k*n,1)  =  0.05+0.25.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.25i.*exp(-i.*t);
% generat a discretization of intervals: (-1,1)\[0.25,0.75]
s=-1:0.001:1;
s(abs(s)>=1)     = NaN;
s(abs(s-0.05)<=0.25)   = NaN;
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
save('s2cr05_0_pt.mat',  's', '-ascii', '-double')
save('Rs2cr05_0_pt.mat', 'R', '-ascii', '-double')
%