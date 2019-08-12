% Example_3cr00_contour_save.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x3cr_00_pt.mat, y3cr_00_pt.mat, R3cr_00_pt.mat,
% which will be used by the MATLAB file:
% Example_3cr00_contour_plot.m
% to plot the contour lines in Figure 14 (center) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0, theta_1,theta_2
% here theta_1=theta_2=0 (the canonical 
% domain is the unit disk with 2 radial slits
%
thetak = [pi/2;0;0];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1;
et(1+(k-1)*n:k*n,1)  =  3.* exp(i.*t);
etp(1+(k-1)*n:k*n,1) =  3i.*exp(i.*t);
k  =  2;
et(1+(k-1)*n:k*n,1)  =  1.5+1.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =     -1i.*exp(-i.*t);
k  =  3;
et(1+(k-1)*n:k*n,1)  = -1.5+1.* exp(-i.*t);
etp(1+(k-1)*n:k*n,1) =     -1i.*exp(-i.*t);
% generat a meshgrid in the domain G
[x,y]=meshgrid([-2.98:0.05:-2.63,-2.6:0.02:-1.5,-1.46:0.05:-0.01,0,0.01:0.05:1.46,1.5:0.02:2.6,2.63:0.05:2.98],...
    [-2.98:0.05:-0.03,-0.01,0,0.01,0.03:0.05:2.98]);
z=x+i*y;
z(abs(z)>=3-1e-2 | abs(z-1.5)<=1+5e-3 | abs(z+1.5)<=1+5e-3) = NaN+i*NaN;
sum(sum(abs(z)>=0))
% 
% 
hold on
box on
plot(real(z),imag(z),'.r');
k  =  1; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  2; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
k  =  3; crv=et(1+(k-1)*n:k*n,1);plot(real(crv),imag(crv),'k')
axis equal
grid on
axis([-3.01  3.01 -3.01  3.01])
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
save('x3cr_00_pt.mat', 'x', '-ascii', '-double')
save('y3cr_00_pt.mat', 'y', '-ascii', '-double')
save('R3cr_00_pt.mat', 'R', '-ascii', '-double')
%