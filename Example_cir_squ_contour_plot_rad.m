% Example_cir_squ_contour_plot_rad.m
% Nasser June 22, 2019
clear;clc
% The data in the files:
% xcirsqu0_pt.mat, ycirsqu0_pt.mat, Rcirsqu0_pt
% which has been generated by the MATLAB file:
% Example_cir_squ_contour_save_rad.m
% will be loaded in this file to plot Figure 13 (third row, right)
% in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
% 
%
%%
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the rectangle boundary
orec_ver    = [1+i        ; -1+i         ; -1-i        ;  1-i        ]; % Vertices of the outer square
[et(1:n,1)     , etp(1:n,1)     ] = polygonp(orec_ver,n/length(orec_ver));
et(n+1:2*n,1)  =  0.25.*exp(-i.*t);
etp(n+1:2*n,1) = -0.25i.*exp(-i.*t);
%
x=load('xcirsqu0_pt.mat','-ascii');
y=load('ycirsqu0_pt.mat','-ascii');
R=load('Rcirsqu0_pt.mat','-ascii');
%%
figure
tv=[0.1,0.25,0.4,0.55,0.7,0.9,1.1,1.5,2.2,5];
hold on
box on
contour(x,y,R,tv,'Color','b','LineWidth',1.0);
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'k','LineWidth',1.2)
axis equal
grid on
axis([-1.01  1.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_cirsqu0
print -dpdf  fig_cirsqu0
%%
R1=R;
R1(R1>=4.1)=NaN;
figure
surf(x,y,R1);
hold on
shading interp
colormap jet
view(140,20)
 contour(x,y,R1,tv,'Color','k','LineWidth',1.0);
% box on
for k=1:2
    crv = et(1+(k-1)*n:k*n,1);crv(end+1)=crv(1);
    plot(real(crv),imag(crv),'k','LineWidth',1.5)
end
% set(gca,'XTick',[-3:1:3],'FontSize',15);
% set(gca,'YTick',[-3:1:3]);
% set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis([-1 1 -1 1 0 2])
%%