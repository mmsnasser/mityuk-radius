% Example_7cr55_contour_save.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x7cr_55_pt.mat, y7cr_55_pt.mat, R7cr_55_pt.mat,
% which will be used by the MATLAB file:
% Example_7cr55_contour_plot.m
% to plot the contour lines in Figure 17 (left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0, theta_1, ..., theta_6
% here theta_1=theta_2=theta_3=theta_4=theta_5=theta_6=pi/2 (the canonical 
% domain is the unit disk with 6 circular slits
%
thetak = [pi/2;pi/2;pi/2;pi/2;pi/2;pi/2;pi/2];
centk  = [0       ; 0.2+0.0i; 0.5+0.5i;-0.1+0.5i;-0.6+0.1i;-0.4-0.5i; 0.3-0.6i; ];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
for k=2:length(centk)
    % the inner circle: |z-0.0|=0.2
    et(1+(k-1)*n:k*n,1)  =  centk(k) +0.15.* exp(-i.*t);
    etp(1+(k-1)*n:k*n,1) =           -0.15i.*exp(-i.*t);
end
% 
% generat a meshgrid in the domain G
[x,y]=meshgrid([-0.99:0.01:0.99],[-0.99:0.01:0.99]);
z=x+i*y;
z(abs(z)>=1) = NaN;
for k=2:length(centk)
    z(abs(z-centk(k))<=0.15) = NaN;
end
sum(sum(abs(z)>=0))

figure
hold on
box on
plot(real(z),imag(z),'.r');
for k=1:length(centk)
    crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k');
end
axis equal
grid on
axis([-1.01  1.01 -1.01  1.01])
axis off
%
% 
% 
% computing the values of Compute Mityuk's radius R(G,alpha) where alpha is
% the matrix of meshgrid points
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        if abs(z(k,j))>=0
            R(k,j)  =  Mityuk(et,etp,n,thetak,z(k,j));
        else
            R(k,j)  =  NaN;
        end
        [x(k,j) y(k,j) R(k,j)]
    end
end
% save the data
save('x7cr_55_pt.mat', 'x', '-ascii', '-double')
save('y7cr_55_pt.mat', 'y', '-ascii', '-double')
save('R7cr_55_pt.mat', 'R', '-ascii', '-double')
%