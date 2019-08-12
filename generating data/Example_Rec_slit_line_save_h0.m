% Example_Rec_slit_line_save_h0.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% s_rs_h_0_pt.mat, Rs_rs_h_0_pt.mat, 
% which will be used by the MATLAB file:
% Example_Rec_slit_line_plot.m
% to plot Figure 10 (right) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit
%
thetak   =  [pi/2;0];
%
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the rectangle boundary
rec_ver    = [3+i   ; -3+i   ; -3-i    ;   3-i  ]; % Vertices of the rectangle
[zet(1:n,1)    ,zetp(1:n,1)    ] = polygonp(rec_ver,n/length(rec_ver));
%%
Psi1  = @(z)(0.25.*(z+1./z)+0.5);
Psi2  = @(z)((2*z-1).*(1+sqrt(1-1./((2*z-1).^2))));
Psi2p = @(z)(4./(1-1./(Psi2(z).^2)));
%%
et(1:n,1)      =  Psi2(zet(1:n,1));
etp(1:n,1)     =  Psi2p(zet(1:n,1)).*zetp(1:n,1);
et(n+1:2*n,1)  =  exp(-i.*t);
etp(n+1:2*n,1) = -i.*exp(-i.*t);
%%

%%
s   = [-2.999,-2.998:0.004:-0.002,-0.001,0.001,0.002:0.004:0.498,0.499,0.501,0.502:0.004:2.998,2.999];
z1  =  s; z1(s>=0 & s<=1)=NaN;
z2  =  s+0.01i;
z3  =  s+0.1i;
w1  =  Psi2(z1);
w2  =  Psi2(z2);
w3  =  Psi2(z3);
sum(sum(abs(s)>=0))
%%


%%
figure
hold on
box on
plot(real(zet(1:n,1)),imag(zet(1:n,1)),'k','LineWidth',1.2)
plot([0 1],[0 0],'b','LineWidth',1.2)
plot(real(z1),imag(z1),'.r')
plot(real(z2),imag(z2),'.g')
plot(real(z3),imag(z3),'.b')
axis equal
axis([-3.01  3.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
plot(real(w1),imag(w1),'.r')
plot(real(w2),imag(w2),'.g')
plot(real(w3),imag(w3),'.b')
% plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')
axis equal
axis([-14.25  10.25 -4.5  4.5])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%%

%%
itrr=0;
npm = length(s);
for k=1:npm
    itrr=itrr+1;
    if abs(w1(k))>=0
        tic
        R1(k)  =  Mityuk(et,etp,n,thetak,w1(k))/abs(Psi2p(z1(k)));
        toc
    else
        R1(k)  =  NaN;
    end
    R2(k)  =  Mityuk(et,etp,n,thetak,w2(k))/abs(Psi2p(z2(k)));
    R3(k)  =  Mityuk(et,etp,n,thetak,w3(k))/abs(Psi2p(z3(k)));
    [itrr R1(k) R2(k) R3(k)]
end
%%
save('s_rs_h_0_pt.mat',  's', '-ascii', '-double')
save('Rs_rs_h_0_pt.mat', 'R1', '-ascii', '-double')
%