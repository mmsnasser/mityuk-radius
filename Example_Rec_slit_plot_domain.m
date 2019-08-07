% Example_Rec_slit_plot_domain.m
% Nasser June 12, 2019
clear;clc
% To plot Figure 8 in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
%
n        =   2^17
t        =  (0:2*pi/n:2*pi-2*pi/n).';
m        =   2;
% The parametization of the rectangle boundary
rec_ver    = [3+i   ; -3+i   ; -3-i    ;   3-i  ]; % Vertices of the rectangle
[zet(1:n,1)    ,zetp(1:n,1)    ] = polygonp(rec_ver,n/length(rec_ver));
alphao      =   -1;
%
Psi   = @(z)(0.25.*(z+1./z)+0.5);
Psii  = @(z)((2*z-1).*(1+sqrt(1-1./((2*z-1).^2))));
Psiip = @(z)(4./(1-1./(Psii(z).^2)));
%%
et(1:n,1)      =  Psii(zet(1:n,1));
etp(1:n,1)     =  Psiip(zet(1:n,1)).*zetp(1:n,1);
et(n+1:2*n,1)  =  exp(-i.*t);
etp(n+1:2*n,1) = -i.*exp(-i.*t);
alpha          =  Psii(alphao);
z2             =  0;
%
figure
hold on
box on
plot(real(zet(1:n,1)),imag(zet(1:n,1)),'k','LineWidth',1.2)
plot([0 1],[0 0],'b','LineWidth',1.2)
axis equal
axis([-3.01  3.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_rec_or
%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
% plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')
axis equal
axis([-14.25  10.25 -4.5  4.5])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_rec_im
%