% Example_7cr55_contour_plot.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% x7cr_55_pt.mat, y7cr_55_pt.mat, R7cr_55_pt.mat,
% which will be used by the MATLAB file:
% Example_7cr55_contour_save.m
% to plot the contour lines in Figure 17 (left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
%
% The parametrization of the boundary
centk  = [0       ; 0.2+0.0i; 0.5+0.5i;-0.1+0.5i;-0.6+0.1i;-0.4-0.5i; 0.3-0.6i; ];
% The parametrization of the boundary
n  =  2^14;
t  = [0:2*pi/n:2*pi-2*pi/n].';
k  =  1; % the unit circle: |z|=1
et(1+(k-1)*n:k*n,1)  =  1.* exp(i.*t);
for k=2:length(centk)
    % the inner circle: |z-0.0|=0.2
    et(1+(k-1)*n:k*n,1)  =  centk(k) +0.15.* exp(-i.*t);
end
%
x=load('x7cr_55_pt.mat','-ascii');
y=load('y7cr_55_pt.mat','-ascii');
R=load('R7cr_55_pt.mat','-ascii');
%%
tv=[0.06,0.50,0.54,0.59,0.61];
tvr=[0.1244,0.1604,0.1903,0.2215,0.3138,0.3911,0.414,0.4546,0.4575];
figure
hold on
box on
contour(x,y,R,tv,'Color','b','LineWidth',1.0);
contour(x,y,R,tvr,'Color','r','LineWidth',1.0);
for k=1:length(centk)
    crv = et(1+(k-1)*n:k*n,1);crv(end+1)=crv(1);
    plot(real(crv),imag(crv),'k','LineWidth',1.5)
end

set(gca,'XTick',[-1:1:1],'FontSize',15);
set(gca,'YTick',[-1:1:1]);

set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis off
% print -depsc fig_5cir55
% print -dpdf  fig_5cir55
% print('fig_5cir55','-depsc','-r1000')
set(gcf,'renderer','painters')
print(gcf,'-depsc2','fig_7cir55.eps')
print(gcf,'-dpdf','fig_7cir55.pdf')
%