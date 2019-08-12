% Example_tri_tri_contour_save_rad.m
% Nasser June 17, 2019
clear;clc
% To generate the data in the files:
% xtritri0_pt.mat, ytritri0_pt.mat, Rtritri0_pt
% which will be used by the MATLAB file:
% Example_tri_tri_contour_plot_rad.m
% to plot the contour lines in Figure 11 (right) in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=0 (the canonical domain is the unit disk with a radial slit 
thetak   =  [pi/2;0];
%
n        =   3*2^13
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the rectangle boundary
out_ver    = [0    ; 5    ; 4+5i ]; % Vertices of the outer triangle
in_ver     = [3+3i ; 4+3i ; 3+i  ]; % Vertices of the iner triangle
[et(1:n,1)     , etp(1:n,1)     ] = polygonp(out_ver,n/length(out_ver));
[et(n+1:2*n,1) , etp(n+1:2*n,1) ] = polygonp(in_ver,n/length(in_ver));
alpha       =  2+i;
z2          =  3.25+2.5i;
%
%
[x,y]=meshgrid([0.05:0.05:2.85,2.9:0.02:4.1,4.15:0.05:4.95],...
               [0.05:0.05:0.85,0.9:0.02:3.1,3.15:0.05:4.95]);
z=x+i*y;
[in on] = inpolygon(x,y,real(out_ver),imag(out_ver));
z(~in)=NaN+i*NaN; 
z(on)=NaN+i*NaN;
[in on] = inpolygon(x,y,real(in_ver),imag(in_ver));
z(in)=NaN+i*NaN; 
z(on)=NaN+i*NaN;
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
axis([-.1  6.1 -0.1  5.1])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
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
%
save('xtritri0_pt.mat', 'x', '-ascii', '-double')
save('ytritri0_pt.mat', 'y', '-ascii', '-double')
save('Rtritri0_pt.mat', 'R', '-ascii', '-double')
%