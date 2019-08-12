% Example_squ_cir_contour_save_cir.m
% Nasser June 22, 2019
clear;clc
% To generate the data in the files:
% xsqucir5_pt.mat, ysqucir5_pt.mat, Rsqucir5_pt
% which will be used by the MATLAB file:
% Example_squ_cir_contour_plot_cir.m
% to plot the contour lines in Figure 13 (second row, left) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=pi/2 (the canonical domain is the unit disk with a circular
% slit 
thetak   =  [pi/2;pi/2];
%
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the rectangle boundary
et(1:n,1)   =     exp(i.*t);
etp(1:n,1)  =  i.*exp(i.*t);
irec_ver    = [0.25+0.25i ;  0.25-0.25i  ; -0.25-0.25i ; -0.25+0.25i ]; % Vertices of the iner square
[et(n+1:2*n,1) , etp(n+1:2*n,1) ] = polygonp(irec_ver,n/length(irec_ver));
alpha       =  0.625;
z2          =  0;
%
%
[x,y]=meshgrid([-0.99:0.04:-0.51,-0.49:0.01:0.49,0.51:0.04:0.99],...
               [-0.99:0.04:-0.51,-0.49:0.01:0.49,0.51:0.04:0.99]);
z=x+i*y;
z(abs(z)>=1)=NaN;
z(x>=-0.25 & x<=0.25 & y>=-0.25 & y<=0.25)=NaN+i*NaN;
sum(sum(abs(z)>=0))
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
save('xsqucir5_pt.mat', 'x', '-ascii', '-double')
save('ysqucir5_pt.mat', 'y', '-ascii', '-double')
save('Rsqucir5_pt.mat', 'R', '-ascii', '-double')
%