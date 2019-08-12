% Example_Rec_slit_contour_save_cir.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% xrecslit5_pt.mat, yrecslit5_pt.mat, Rrecslit5_pt
% which will be used by the MATLAB file:
% Example_Rec_slit_contour_plot_cir.m
% to plot the contour lines in Figure 9 (left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=pi/2 (the canonical domain is the unit disk with a circular
% slit
%
thetak   =  [pi/2;pi/2];
%
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
m        =   2;
% The parametization of the rectangle boundary
rec_ver    = [3+i   ; -3+i   ; -3-i    ;   3-i  ]; % Vertices of the rectangle
[zet(1:n,1)    ,zetp(1:n,1)    ] = polygonp(rec_ver,n/length(rec_ver));
%
Psih  = @(z)(0.25.*(z+1./z)+0.5);
Psi   = @(z)((2*z-1).*(1+sqrt(1-1./((2*z-1).^2))));
Psip  = @(z)(4./(1-1./(Psi(z).^2)));
%
et(1:n,1)      =  Psi(zet(1:n,1));
etp(1:n,1)     =  Psip(zet(1:n,1)).*zetp(1:n,1);
et(n+1:2*n,1)  =  exp(-i.*t);
etp(n+1:2*n,1) = -i.*exp(-i.*t);
%
%
[x,y]=meshgrid([-2.96:0.04:-0.12,-0.08:0.01:0.08,0.12:0.04:0.88,0.92:0.01:1.08,1.12:0.04:2.96],...
               [-0.96:0.04:-0.36,-0.35:0.01:-0.29,-0.28:0.04:0.28,0.29:0.01:0.35,0.36:0.04:0.96]);
z=x+i*y;
sum(sum(abs(z)>=0))
w=Psi(z);
%
figure
hold on
box on
plot(real(zet(1:n,1)),imag(zet(1:n,1)),'k','LineWidth',1.2)
plot([0 1],[0 0],'b','LineWidth',1.2)
plot(real(z),imag(z),'.r','markerFaceColor','r')
axis equal
axis([-3.01  3.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
plot(real(w),imag(w),'.r','markerFaceColor','r')
% plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')
axis equal
axis([-14.25  10.25 -4.5  4.5])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%
%
itrr=0;
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        itrr=itrr+1
        if (x(k,j)>=-0.01 & x(k,j)<=1.01 & abs(y(k,j))<=0.01)
            R(k,j) = NaN;
        else
            tic
            R(k,j)  =  Mityuk(et,etp,n,thetak,w(k,j))/abs(Psip(z(k,j)));
            toc
        end
    end
end
%
save('xrecslit5_pt.mat', 'x', '-ascii', '-double')
save('yrecslit5_pt.mat', 'y', '-ascii', '-double')
save('Rrecslit5_pt.mat', 'R', '-ascii', '-double')
%
