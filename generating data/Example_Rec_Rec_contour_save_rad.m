% Example_Rec_Rec_contour_save_rad.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% xrecrec0_pt.mat, yrecrec0_pt.mat, Rrecrec0_pt
% which will be used by the MATLAB file:
% Example_Rec_Rec_contour_plot_rad.m
% to plot the contour lines in Figure 11 (left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit 
thetak   =  [pi/2;0];
%
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the rectangle boundary
orec_ver    = [3+i    ; -3+i   ; -3-i    ;   3-i  ]; % Vertices of the outer rectangle
irec_ver    = [1+0.5i ;  1     ;  0      ;   0.5i  ]; % Vertices of the iner rectangle
[et(1:n,1)     , etp(1:n,1)     ] = polygonp(orec_ver,n/length(orec_ver));
[et(n+1:2*n,1) , etp(n+1:2*n,1) ] = polygonp(irec_ver,n/length(irec_ver));
alpha       = -1;
z2          =  0.5+0.25i;
%
%
[x,y]=meshgrid([-2.99:0.04:-0.11,-0.08:0.01:0.08,0.10:0.04:0.90,0.92:0.01:1.08,1.11:0.04:2.99],...
               [-0.99:0.04:-0.11,-0.08:0.01:0.08,0.10:0.04:0.40,0.42:0.01:0.57,0.59:0.04:0.99]);
z=x+i*y;
z(x>=0 & x<=1 & y>=0 & y<=0.5)=NaN+i*NaN;
sum(sum(abs(z)>=0))
%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
plot(real(z),imag(z),'.r','markerFaceColor','r')
% plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')
axis equal
axis([-3.01  3.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%
%
itrr=0;
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        itrr=itrr+1;
        if (abs(z(k,j))>=0)
            tic
            R(k,j)  =  Mityuk(et,etp,n,thetak,z(k,j));
            toc
        else
            R(k,j) = NaN;
        end
        [itrr R(k,j)]
    end
end
%
save('xrecrec0_pt.mat', 'x', '-ascii', '-double')
save('yrecrec0_pt.mat', 'y', '-ascii', '-double')
save('Rrecrec0_pt.mat', 'R', '-ascii', '-double')
%