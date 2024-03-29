% Example_7cr00_contour_plot.m
% Nasser June 22, 2019
clear;clc
% The data in the files:
% x7cr_00_pt.mat, y7cr_00_pt.mat, R7cr_00_pt.mat,
% which has been generated by the MATLAB file:
% Example_7cr00_contour_save.m
% will be loaded in this file to plot Figure 17 (center)
% in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
% 
%
%%
thetak = [pi/2;0;0;0;0;0;0];
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
x=load('x7cr_00_pt.mat','-ascii');
y=load('y7cr_00_pt.mat','-ascii');
R=load('R7cr_00_pt.mat','-ascii');
%%
tv=[0.05,0.16,0.3,0.5,0.8,1.4,3.5];
tvr=[1.6856,1.777,1.782,1.9508,2.3835];
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
% print -depsc fig_5cir00
% print -dpdf  fig_5cir00
set(gcf,'renderer','painters')
print(gcf,'-depsc2','fig_7cir00.eps')
print(gcf,'-dpdf','fig_7cir00.pdf')
%