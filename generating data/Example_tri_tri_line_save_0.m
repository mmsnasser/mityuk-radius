% Example_tri_tri_line_save_0.m
% Nasser June 18, 2019
clear;clc
% To generate the data in the files:
% s_tri_0_pt.mat, Rs_tri_v_01_pt.mat
% Rs_tri_v_01_pt.mat, Rs_tri_v_02_pt.mat
% Rs_tri_h_01_pt.mat, Rs_tri_h_02_pt.mat
% which will be used by the MATLAB file:
% Example_tri_tri_line_plot.m
% to plot Figure 12 in the paper:
% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for some canonical slit domains. 
% 
%
% choose the values of theta_0 and theta_1
% here theta_1=pi/2 (the canonical domain is the unit disk with a circular
% slit
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
zv2          =  3.25+2.5i;
%
%
s    = [0:0.0025:5];
zv1  =  3+i*s;  
[in1 on1] = inpolygon(real(zv1),imag(zv1),real(out_ver),imag(out_ver));
zv1(~in1)=NaN+i*NaN; 
zv1(on1) =NaN+i*NaN;
[in1 on1] = inpolygon(real(zv1),imag(zv1),real(in_ver),imag(in_ver));
zv1(in1)=NaN+i*NaN; 
zv1(on1)=NaN+i*NaN;
sum(sum(abs(zv1)>=0))
%
zv2  =  4+i*s; 
[in2 on2] = inpolygon(real(zv2),imag(zv2),real(out_ver),imag(out_ver));
zv2(~in2)=NaN+i*NaN; 
zv2(on2) =NaN+i*NaN;
[in2 on2] = inpolygon(real(zv2),imag(zv2),real(in_ver),imag(in_ver));
zv2(in2)=NaN+i*NaN; 
zv2(on2)=NaN+i*NaN;
sum(sum(abs(zv2)>=0))
%
zh1  =  s+i;  
[in1 on1] = inpolygon(real(zh1),imag(zh1),real(out_ver),imag(out_ver));
zh1(~in1)=NaN+i*NaN; 
zh1(on1) =NaN+i*NaN;
[in1 on1] = inpolygon(real(zh1),imag(zh1),real(in_ver),imag(in_ver));
zh1(in1)=NaN+i*NaN; 
zh1(on1)=NaN+i*NaN;
sum(sum(abs(zh1)>=0))
%
zh2  =  s+3i; 
[in2 on2] = inpolygon(real(zh2),imag(zh2),real(out_ver),imag(out_ver));
zh2(~in2)=NaN+i*NaN; 
zh2(on2) =NaN+i*NaN;
[in2 on2] = inpolygon(real(zh2),imag(zh2),real(in_ver),imag(in_ver));
zh2(in2)=NaN+i*NaN; 
zh2(on2)=NaN+i*NaN;
sum(sum(abs(zh2)>=0))
% 
%
figure
hold on
box on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'k','LineWidth',1.2)
plot(real(zv1),imag(zv1),'.r')
plot(real(zv2),imag(zv2),'.g')
plot(real(zh1),imag(zh1),'.m')
plot(real(zh2),imag(zh2),'.b')
axis equal
axis([-.1  6.1 -0.1  5.1])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
%
%
itrr=0;
npm = length(s);
for k=1:npm
    itrr=itrr+1;
    if abs(zv1(k))>=0
        Rv1(k)  =  Mityuk(et,etp,n,thetak,zv1(k));
    else
        Rv1(k)  =  NaN;
    end
    if abs(zv2(k))>=0
        Rv2(k)  =  Mityuk(et,etp,n,thetak,zv2(k));
    else
        Rv2(k)  =  NaN;
    end
    if abs(zh1(k))>=0
        Rh1(k)  =  Mityuk(et,etp,n,thetak,zh1(k));
    else
        Rh1(k)  =  NaN;
    end
    if abs(zh2(k))>=0
        Rh2(k)  =  Mityuk(et,etp,n,thetak,zh2(k));
    else
        Rh2(k)  =  NaN;
    end
    [itrr Rv1(k) Rv2(k) Rh1(k) Rh2(k)]
end
%
%
save('s_tri_0_pt.mat',  's', '-ascii', '-double')
save('Rs_tri_v_01_pt.mat', 'Rv1', '-ascii', '-double')
save('Rs_tri_v_02_pt.mat', 'Rv2', '-ascii', '-double')
save('Rs_tri_h_01_pt.mat', 'Rh1', '-ascii', '-double')
save('Rs_tri_h_02_pt.mat', 'Rh2', '-ascii', '-double')
%