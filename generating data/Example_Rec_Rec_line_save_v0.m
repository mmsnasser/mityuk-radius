% Example_Rec_Rec_line_save_v0.m
% Nasser June 12, 2019
clear;clc
% To generate the data in the files:
% s_rr_v_0_pt.mat, Rs_rr_v_0_1_pt.mat, Rs_rr_v_0_2_pt.mat,
% Rs_rr_v_0_3_pt.mat, Rs_rr_v_0_4_pt.mat
% which will be used by the MATLAB file:
% Example_Rec_Rec_line_plot.m
% to plot Figure 12 (center) in the paper:
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
orec_ver    = [3+i    ; -3+i   ; -3-i    ;   3-i  ]; % Vertices of the outer rectangle
irec_ver    = [1+0.5i ;  1     ;  0      ;   0.5i  ]; % Vertices of the iner rectangle
[et(1:n,1)     , etp(1:n,1)     ] = polygonp(orec_ver,n/length(orec_ver));
[et(n+1:2*n,1) , etp(n+1:2*n,1) ] = polygonp(irec_ver,n/length(irec_ver));
alpha       = -1;
z2          =  0.5+0.25i;
%
%
s   = [-0.999,-0.998:0.004:-0.002,-0.001,0.001,0.002:0.004:0.498,0.499,0.501,0.502:0.004:0.998,0.999];
z1  =      i*s;  z1(s>=0 & s<=0.5)=NaN;
z2  =  0.25+i*s; z2(s>=0 & s<=0.5)=NaN;
z3  =  0.5+i*s;  z3(s>=0 & s<=0.5)=NaN;
z4  =  1  +i*s;  z4(s>=0 & s<=0.5)=NaN;
sum(sum(abs(s)>=0))
%
%
figure
hold on
box on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'k','LineWidth',1.2)
plot(real(z1),imag(z1),'.r')
plot(real(z2),imag(z2),'.g')
plot(real(z3),imag(z3),'.m')
plot(real(z4),imag(z4),'.b')
axis equal
axis([-3.01  3.01 -1.01  1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%
%
itrr=0;
npm = length(s);
for k=1:npm
    itrr=itrr+1;
    if abs(z1(k))>=0
        tic
        R1(k)  =  Mityuk(et,etp,n,thetak,z1(k));
        toc
        R2(k)  =  Mityuk(et,etp,n,thetak,z2(k));
        R3(k)  =  Mityuk(et,etp,n,thetak,z3(k));
        R4(k)  =  Mityuk(et,etp,n,thetak,z4(k));
    else
        R1(k)  =  NaN;
        R2(k)  =  NaN;
        R3(k)  =  NaN;
        R4(k)  =  NaN;
    end
    [itrr R1(k) R2(k) R3(k) R4(k)]
end
%
save('s_rr_v_0_pt.mat',  's', '-ascii', '-double')
save('Rs_rr_v_0_1_pt.mat', 'R1', '-ascii', '-double')
save('Rs_rr_v_0_2_pt.mat', 'R2', '-ascii', '-double')
save('Rs_rr_v_0_3_pt.mat', 'R3', '-ascii', '-double')
save('Rs_rr_v_0_4_pt.mat', 'R4', '-ascii', '-double')
%