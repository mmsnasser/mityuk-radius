% Example_6cr50_contour_save.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x5cr_50_pt.mat, y5cr_50_pt.mat, R5cr_50_pt.mat,
% which will be used by the MATLAB file:
% Example_6cr50_contour_plot.m
% to plot the contour lines in Figure 16 (second row, center) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0, theta_1, ..., theta_5
% here theta_1=theta_3=theta_5=pi/2, theta_2=theta_4=0 (the canonical 
% domain is the unit disk with 2 radial slits and 3 circular slits
%
thetak = [pi/2;pi/2;0;pi/2;0;pi/2];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  1i.*exp(i.*t);
k  =  2; % the inner circle: |z-0.0|=0.2
et(1+(k-1)*n:k*n,1)  =  0.0 +0.2.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.2i.*exp(-i.*t);
k  =  3; % the inner circle: |z-0.6|=0.2
et(1+(k-1)*n:k*n,1)  =  0.6 +0.2.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.2i.*exp(-i.*t);
k  =  4; % the inner circle: |z-0.6i|=0.2
et(1+(k-1)*n:k*n,1)  =  0.6i+0.2.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.2i.*exp(-i.*t);
k  =  5; % the inner circle: |z+0.6|=0.2
et(1+(k-1)*n:k*n,1)  = -0.6 +0.2.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.2i.*exp(-i.*t);
k  =  6; % the inner circle: |z+0.6i|=0.2
et(1+(k-1)*n:k*n,1)  = -0.6i+0.2.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =      -0.2i.*exp(-i.*t);
% generat a meshgrid in the domain G
% [x,y]=meshgrid([-0.99:0.02:-0.89,-0.895:0.005:-0.855,-0.85:0.02:-0.33,-0.32:0.005:-0.275,-0.27:0.02:-0.05,...
%                 -0.04:0.005:0.04,0.05:0.02:0.27,0.275:0.005:0.32,0.33:0.02:0.85,0.855:0.005:0.895,0.89:0.02:0.99],...
%                [-0.99:0.02:-0.89,-0.895:0.005:-0.855,-0.85:0.02:-0.33,-0.32:0.005:-0.275,-0.27:0.02:-0.05,...
%                 -0.04:0.005:0.04,0.05:0.02:0.27,0.275:0.005:0.32,0.33:0.02:0.85,0.855:0.005:0.895,0.89:0.02:0.99]);
[x,y]=meshgrid([-0.99:0.01:0.99],[-0.99:0.01:0.99]);
z=x+i*y;
z(abs(z)>=1 | abs(z)<=0.2 | abs(z-0.6)<=0.2 | abs(z-0.6i)<=0.2 | abs(z+0.6)<=0.2 | abs(z+0.6i)<=0.2) = NaN;
sum(sum(abs(z)>=0))
% 
% plot(real(z),imag(z),'.r');
% 
hold on
box on
plot(real(z),imag(z),'.r');
k  =  1; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  2; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  3; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  4; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  5; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  6; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
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
save('x5cr_50_pt.mat', 'x', '-ascii', '-double')
save('y5cr_50_pt.mat', 'y', '-ascii', '-double')
save('R5cr_50_pt.mat', 'R', '-ascii', '-double')
%