% Example_ann_contour_plot_rad.m
% Nasser June 12, 2019
clear;clc
% The data in the files:
% xan0p_pt.mat, yan0p_pt.mat, Ran0p_pt.mat,
% which has been generated by the MATLAB file:
% Example_ann_contour_save_rad.m
% will be loaded in this file to plot the contour lines and the surface in
% Figure 3 in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
%
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
k  =  2; % the inner circle: |z|=0.25
et(1+(k-1)*n:k*n,1)  =  0.25.* exp(-i.*t);
% loading the data files
x=load('xan0_pt.mat','-ascii');
y=load('yan0_pt.mat','-ascii');
R=load('Ran0_pt.mat','-ascii');
% 
% 
% plot the contour lines
tv  = [0.1,0.25,0.4,0.55,0.7,0.9,1.2,2]; %level values
figure
hold on
box on
contour(x,y,R,tv,'Color','b','LineWidth',1.0,'ShowText','on');
% [cnt1,cnt2] =  contour(x,y,R,tv,'Color','b','LineWidth',1.0);
% clabel(cnt1, 'manual','FontSize',15,'Color','k')
for k=1:2
    crv = et(1+(k-1)*n:k*n,1);crv(end+1)=crv(1);
    plot(real(crv),imag(crv),'k','LineWidth',1.5)
end
set(gca,'XTick',[-3:1:3],'FontSize',15);
set(gca,'YTick',[-3:1:3]);
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
% axis off
% print -depsc fig_ann_0R
% print -dpdf  fig_ann_0R
% 
% 
% plot the surface
figure
R1=R; R1(R1>=5.1)=NaN; % remove large values to get a nice color distrubation on the surface
surfc(x,y,R1);
hold on
shading interp
colormap jet
view(140,20)
contour(x,y,R,tv,'Color','k','LineWidth',1.0);
for k=1:2
    crv = et(1+(k-1)*n:k*n,1);crv(end+1)=crv(1);
    plot(real(crv),imag(crv),'k','LineWidth',1.5)
end
axis equal
axis([-1 1 -1 1 0.0 4.0])
% print -depsc fig_ann_0S
% print -dpdf fig_ann_0S
%