% Example_2cr05_contour_save_cir.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x2cr05_5_pt.mat, y2cr05_5_pt.mat, R2cr05_5_pt.mat,
% which will be used by the MATLAB file:
% Example_2cr05_contour_plot_cir.m
% to plot the contour lines in Figure 5 (first row, left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=pi/2 (the canonical domain is the unit disk with a circular
% slit
%
thetak = [pi/2;0.5*pi];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
k  =  2; % the inner circle: |z-0.05|=0.25
et(1+(k-1)*n:k*n,1)  =  0.05+0.25.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.25i.*exp(-i.*t);
% generat a meshgrid in the domain G
[r,theta]=meshgrid([linspace(0.251,0.461,18),linspace(0.466,0.496,7),linspace(0.501,1.049,50)],[linspace(0,2*pi,101)]);
x=0.05+r.*cos(theta);
y=r.*sin(theta);
z=x+i*y;
z(abs(z)>=1)     = NaN;
z(abs(z-0.05)<=0.25)   = NaN;
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
save('x2cr05_5_pt.mat', 'x', '-ascii', '-double')
save('y2cr05_5_pt.mat', 'y', '-ascii', '-double')
save('R2cr05_5_pt.mat', 'R', '-ascii', '-double')
%