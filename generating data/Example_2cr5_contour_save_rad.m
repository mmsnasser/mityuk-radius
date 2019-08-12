% Example_2cr5_contour_save_rad.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x2cr5_0_pt.mat, y2cr5_0_pt.mat, R2cr5_0_pt.mat,
% which will be used by the MATLAB file:
% Example_2cr5_contour_plot_rad.m
% to plot the contour lines in Figure 5 (second row, center) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit
%
thetak = [pi/2;0.0*pi];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
k  =  2; % the inner circle: |z-0.5|=0.25
et(1+(k-1)*n:k*n,1)  =  0.5+0.25.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =     -0.25i.*exp(-i.*t);
% generat a meshgrid in the domain G
[x,y]=meshgrid([-1:0.02:1],[-1:0.02:1]);
z=x+i*y;
z(abs(z)>=1)     = NaN;
z(abs(z-0.5)<=0.25)   = NaN;
sum(sum(abs(z)>=0))
% 
% 
% computing the values of Compute Mityuk's radius R(G,alpha) where alpha is
% the matrix of meshgrid points
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        if abs(z(k,j))>=0
            tic
            R(k,j)  =  Mityuk(et,etp,n,thetak,z(k,j));
            toc
        else
            R(k,j)  =  NaN;
        end        
    end
end
% save the data
save('x2cr5_0_pt.mat', 'x', '-ascii', '-double')
save('y2cr5_0_pt.mat', 'y', '-ascii', '-double')
save('R2cr5_0_pt.mat', 'R', '-ascii', '-double')
%