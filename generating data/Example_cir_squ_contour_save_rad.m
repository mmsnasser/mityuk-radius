% Example_cir_squ_contour_save_rad.m
% Nasser June 22, 2019
clear;clc
% To generate the data in the files:
% xcirsqu0_pt.mat, ycirsqu0_pt.mat, Rcirsqu0_pt
% which will be used by the MATLAB file:
% Example_cir_squ_contour_plot_rad.m
% to plot the contour lines in Figure 13 (third row, right) in the paper:
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
orec_ver    = [1+i        ; -1+i         ; -1-i        ;  1-i        ]; % Vertices of the outer square
[et(1:n,1)     , etp(1:n,1)     ] = polygonp(orec_ver,n/length(orec_ver));
et(n+1:2*n,1)  =  0.25.*exp(-i.*t);
etp(n+1:2*n,1) = -0.25i.*exp(-i.*t);
alpha       =  0.625;
z2          =  0;
%
%
[x,y]=meshgrid([-0.99:0.04:-0.29,-0.28:0.01:0.28,0.29:0.04:0.99],...
               [-0.99:0.04:-0.29,-0.28:0.01:0.28,0.29:0.04:0.99]);
z=x+i*y;
z(abs(z)<=0.25)=NaN+i*NaN;
sum(sum(abs(z)>=0))
%
%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
plot(real(z),imag(z),'.r','markerFaceColor','r')
% plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')
grid(gca,'minor')
ax=gca;
ax.MinorGridAlpha = 1;
axis equal
axis([-1.01  1.01 -1.01  1.01])
% axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%
%
itrr=0;
[mz,nz]  = size(z);
for k=1:mz
    for j=1:nz
        itrr=itrr+1;
        if (abs(z(k,j))>=0)
            R(k,j)  =  Mityuk(et,etp,n,thetak,z(k,j));
        else
            R(k,j) = NaN;
        end
        [itrr R(k,j)]
    end
end
%%
save('xcirsqu0_pt.mat', 'x', '-ascii', '-double')
save('ycirsqu0_pt.mat', 'y', '-ascii', '-double')
save('Rcirsqu0_pt.mat', 'R', '-ascii', '-double')
%