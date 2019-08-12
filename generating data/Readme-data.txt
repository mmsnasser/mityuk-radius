function Readme-data()
%README
%
% Mohamed Nasser, 2019
% Please cite these collections of MATLAB files as:

% E. Kalmoun, M. Nasser and M. Vuorinen, Numerical computation of Mityuk's
% function and radius for circular/radial slit domains. 
% https://github.com/mmsnasser/***.
%
% 
% The main file in these collections of MATLAB files is the file
% Mityuk.m
% We cal the function as:
% [R,m] = Mityuk(et,etp,n,thetak,alpha)
% which computes Mityuk's radius R(G,alpha) and Mityuk's function
% m(G,alpha) where alpha is a point in G, et, etp: parametrization of 
% the boundary and its first derivative, thetk=[theta_1,...,theta_L] are 
% the oblique angles of the slits, i.e. theta_k=pi/2 if the boundary
% component \Gamma_k is mapped to a circular slit and \theta_k=0 if
% the boundary component \Gamma_k is mapped to a radial slit.
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% This collection of files contains the following files which used to
% generate the data in the main folder
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 
% 
% 
% 1) Example_ann_contour_save_cir.m
% To generate the data in the files:
% xan5p_pt.mat, yan5p_pt.mat, Ran5p_pt.mat,
% 
% 2) Example_ann_contour_save_rad.m
% To generate the data in the files:
% xan0p_pt.mat, yan0p_pt.mat, Ran0p_pt.mat,
% 
% 3) Example_ann_line_save_cir.m
% To generate the data in the files:
% san5_pt.mat, Rsan5_pt.mat,
% 
% 4) Example_ann_line_save_rad.m
% To generate the data in the files:
% san0_pt.mat, Rsan0_pt.mat,
% 
% 5) Example_2cr05_contour_save_cir.m
% To generate the data in the files:
% x2cr05_5_pt.mat, y2cr05_5_pt.mat, R2cr05_5_pt.mat,
% 
% 6) Example_2cr05_contour_save_rad.m
% To generate the data in the files:
% x2cr05_0_pt.mat, y2cr05_0_pt.mat, R2cr05_0_pt.mat,
% 
% 7) Example_2cr05_line_save_rad.m
% To generate the data in the files:
% s2cr05_0_pt.mat, Rs2cr05_0_pt.mat,
% 
% 8) Example_2cr05_line_save_cir.m
% To generate the data in the files:
% s2cr05_5_pt.mat, Rs2cr05_5_pt.mat,
% 
% 9) Example_2cr5_contour_save_cir.m
% To generate the data in the files:
% x2cr5_5_pt.mat, y2cr5_5_pt.mat, R2cr5_5_pt.mat,
% 
% 10) Example_2cr5_contour_save_rad.m
% To generate the data in the files:
% x2cr5_0_pt.mat, y2cr5_0_pt.mat, R2cr5_0_pt.mat,
% 
% 11) Example_2cr5_line_save_rad.m
% To generate the data in the files:
% s2cr5_0_pt.mat, Rs2cr5_0_pt.mat,
% 
% 12) Example_2cr5_line_save_cir.m
% To generate the data in the files:
% s2cr5_5_pt.mat, Rs2cr5_5_pt.mat,
% 
% 13) Example_Rec_slit_contour_save_cir.m
% To generate the data in the files:
% xrecslit5_pt.mat, yrecslit5_pt.mat, Rrecslit5_pt
% 
% 14) Example_Rec_slit_contour_save_rad.m
% To generate the data in the files:
% xrecslit0_pt.mat, yrecslit0_pt.mat, Rrecslit0_pt
% 
% 15) Example_Rec_slit_line_save_h0.m
% To generate the data in the files:
% s_rs_h_0_pt.mat, Rs_rs_h_0_pt.mat, 
% 
% 16) Example_Rec_slit_line_save_v0.m
% To generate the data in the files:
% s_rs_v_0_pt.mat, Rs_rs_v_0_1_pt.mat, Rs_rs_v_0_2_pt.mat,
% Rs_rs_v_0_3_pt.mat, Rs_rs_v_0_4_pt.mat
% 
% 17) Example_Rec_slit_line_save_v5.m
% To generate the data in the files:
% s_rs_v_50_pt.mat, Rs_rs_v_5_1_pt.mat, Rs_rs_v_5_2_pt.mat,
% Rs_rs_v_5_3_pt.mat, Rs_rs_v_5_4_pt.mat
% 
% 18) Example_Rec_Rec_contour_save_cir.m
% To generate the data in the files:
% xrecrec5_pt.mat, yrecrec5_pt.mat, Rrecrec5_pt
% 
% 19) Example_Rec_Rec_contour_save_rad.m
% To generate the data in the files:
% xrecrec0_pt.mat, yrecrec0_pt.mat, Rrecrec0_pt
% 
% 20) Example_Rec_Rec_line_save_h0.m
% To generate the data in the files:
% s_rr_h_0_pt.mat, Rs_rr_h_0_1_pt.mat, Rs_rr_h_0_2_pt.mat, 
% Rs_rr_h_0_3_pt.mat, 
% 
% 21) Example_Rec_Rec_line_save_v0.m
% To generate the data in the files:
% s_rr_v_0_pt.mat, Rs_rr_v_0_1_pt.mat, Rs_rr_v_0_2_pt.mat,
% Rs_rr_v_0_3_pt.mat, Rs_rr_v_0_4_pt.mat
% 
% 22) Example_Rec_Rec_line_save_v5.m
% To generate the data in the files:
% s_rr_v_50_pt.mat, Rs_rr_v_5_1_pt.mat, Rs_rr_v_5_2_pt.mat,
% Rs_rr_v_5_3_pt.mat, Rs_rr_v_5_4_pt.mat
% 
% 23) Example_tri_tri_contour_save_cir.m
% To generate the data in the files:
% xtritri5_pt.mat, ytritri5_pt.mat, Rtritri5_pt
% 
% 24) Example_tri_tri_contour_save_rad.m
% To generate the data in the files:
% xtritri0_pt.mat, ytritri0_pt.mat, Rtritri0_pt
% 
% 25) Example_tri_tri_line_save_0.m
% To generate the data in the files:
% s_tri_0_pt.mat, Rs_tri_v_01_pt.mat
% Rs_tri_v_01_pt.mat, Rs_tri_v_02_pt.mat
% Rs_tri_h_01_pt.mat, Rs_tri_h_02_pt.mat
% 
% 26) Example_tri_tri_line_save_5.m
% To generate the data in the files:
% s_tri_5_pt.mat, Rs_tri_v_51_pt.mat
% Rs_tri_v_51_pt.mat, Rs_tri_v_52_pt.mat
% Rs_tri_h_51_pt.mat, Rs_tri_h_52_pt.mat
% 
% 27) Example_squ_squ_contour_save_cir.m
% To generate the data in the files:
% xsqusqu5_pt.mat, ysqusqu5_pt.mat, Rsqusqu5_pt
% 
% 28) Example_squ_squ_contour_save_rad.m
% To generate the data in the files:
% xsqusqu0_pt.mat, ysqusqu0_pt.mat, Rsqusqu0_pt
% 
% 29) Example_squ_cir_contour_save_cir.m
% To generate the data in the files:
% xsqucir5_pt.mat, ysqucir5_pt.mat, Rsqucir5_pt
% 
% 30) Example_squ_cir_contour_save_rad.m
% To generate the data in the files:
% xsqucir0_pt.mat, ysqucir0_pt.mat, Rsqucir0_pt
% 
% 31) Example_cir_squ_contour_save_cir.m
% To generate the data in the files:
% xcirsqu5_pt.mat, ycirsqu5_pt.mat, Rcirsqu5_pt
% 
% 32) Example_cir_squ_contour_save_rad.m
% To generate the data in the files:
% xcirsqu0_pt.mat, ycirsqu0_pt.mat, Rcirsqu0_pt
% 
% 33) Example_3cr55_contour_save.m
% To generate the data in the files:
% x3cr_55_pt.mat, y3cr_55_pt.mat, R3cr_55_pt.mat,
% 
% 34) Example_3cr00_contour_save.m
% To generate the data in the files:
% x3cr_00_pt.mat, y3cr_00_pt.mat, R3cr_00_pt.mat,
% 
% 35) Example_3cr50_contour_save.m
% To generate the data in the files:
% x3cr_50_pt.mat, y3cr_50_pt.mat, R3cr_50_pt.mat,
% 
% 36) Example_3cr_line_save_55.m
% To generate the data in the files:
% s3cr_55_pt.mat, Rs3cr_55_pt.mat,
% 
% 37) Example_3cr_line_save_00.m
% To generate the data in the files:
% s3cr_00_pt.mat, Rs3cr_00_pt.mat,
% 
% 38) Example_3cr_line_save_50.m
% To generate the data in the files:
% s3cr_50_pt.mat, Rs3cr_50_pt.mat,
% 
% 39) Example_6cr55_contour_save.m
% To generate the data in the files:
% x5cr_55_pt.mat, y5cr_55_pt.mat, R5cr_55_pt.mat,
% 
% 40) Example_6cr00_contour_save.m
% To generate the data in the files:
% x5cr_00_pt.mat, y5cr_00_pt.mat, R5cr_00_pt.mat,
% 
% 41) Example_6cr501_contour_save.m
% To generate the data in the files:
% x5cr_501_pt.mat, y5cr_501_pt.mat, R5cr_501_pt.mat,
% 
% 42) Example_6cr50_contour_save.m
% To generate the data in the files:
% x5cr_50_pt.mat, y5cr_50_pt.mat, R5cr_50_pt.mat,
% 
% 43) Example_6cr502_contour_save.m
% To generate the data in the files:
% x5cr_505_pt.mat, y5cr_502_pt.mat, R5cr_502_pt.mat,
% 
% 44) Example_7cr55_contour_save.m
% To generate the data in the files:
% x7cr_55_pt.mat, y7cr_55_pt.mat, R7cr_55_pt.mat,
% 
% 45) Example_7cr00_contour_save.m
% To generate the data in the files:
% x7cr_00_pt.mat, y7cr_00_pt.mat, R7cr_00_pt.mat,
% 
% 46) Example_7cr50_contour_save.m
% To generate the data in the files:
% x7cr_50_pt.mat, y7cr_50_pt.mat, R7cr_50_pt.mat,
% 
% 
% 
% 
% 
% 
% 
% In the function Mityuk.m, we use the MATLAB function 
% fbie.m
% which is available in:
% 
% M.M.S. Nasser, FBIEGNK:  A MATLAB toolbox for fast solution of 
% boundary integral equations with the generalized Neumann kernel, 
% Version 1.1, 2016. https://github.com/mmsnasser/FBIEGNK.
% 
% and in:
% M.M.S. Nasser, Fast solution of boundary integral equations with the 
% generalized Neumann kernel, Electronic Transactions on Numerical 
% Analysis,  44 (2015) 189--229.
% 
%
% The MATLAB function fbie depends on the following files:
% 
% zfmm2dpart.m
% fmm2d_r2012a.mexw32
% fmm2d_r2012a.mexw64
% pthreadGC2-w32.dll
% pthreadGC2-w64.dll
% 
% from the Toolbox:
% L. G REENGARD AND Z. G IMBUTAS , FMMLIB2D: A MATLAB toolbox for
% fast multipole method in two dimensions, Version 1.2, 2012.
% http://www.cims.nyu.edu/cmcl/fmm2dlib/fmm2dlib.html
% 
% PLEASE cite the FMMLIB2D toolbox whenever you use the function Mityuk.m.
%
%
%
% This program is free software; you can redistribute it and/or modify 
% it under the terms of the GNU General Public License as published by 
% the Free Software Foundation; either version 2 of the License, or 
% (at your option) any later version.  This program is distributed in 
% the hope that it will be useful, but WITHOUT ANY WARRANTY; without 
% even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
% PARTICULAR PURPOSE.  See the GNU General Public License for more 
% details. You should have received a copy of the GNU General Public 
% License along with this program; 
% if not, see <http://www.gnu.org/licenses/>.
%
end