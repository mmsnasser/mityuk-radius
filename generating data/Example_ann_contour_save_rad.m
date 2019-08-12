% Example_ann_contour_save_rad.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% xan0p_pt.mat, yan0p_pt.mat, Ran0p_pt.mat,
% which will be used by the MATLAB file:
% Example_ann_contour_plot_rad.m
% to plot the contour lines and the surface in
% Figure 3 in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit
%
thetak = [pi/2;0];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
%
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
k  =  2; % the inner circle: |z|=0.25
et(1+(k-1)*n:k*n,1)  =  0.25.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) = -0.25i.*exp(-i.*t);
% generat a meshgrid in the domain G={z : 0.25<|z|<1}
[r,theta]=meshgrid([linspace(0.251,0.999,71)],[linspace(0,2*pi,101)]);
x=r.*cos(theta);
y=r.*sin(theta);
z=x+i*y;
sum(sum(abs(z)>=0))
%
% test: ploting the meshgrid
figure
tv=[0.05,0.15,0.25,0.33,0.365];
hold on
box on
plot(x,y,'ob');
for k=1:length(thetak)
    crv = et(1+(k-1)*n:k*n,1);crv(end+1)=crv(1);
    plot(real(crv),imag(crv),'k')
end
axis equal
%
%
% 
% computing the values of Compute Mityuk's radius R(G,alpha) where alpha is
% the matrix of meshgrid points
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        tic
        R(k,j)  =  Mityuk(et,etp,n,thetak,z(k,j));
        toc
    end
end
% 
% save the data
save('xan0_pt.mat', 'x', '-ascii', '-double')
save('yan0_pt.mat', 'y', '-ascii', '-double')
save('Ran0_pt.mat', 'R', '-ascii', '-double')
%