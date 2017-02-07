% Demo for PCNN in image processing
% ---------
% Author:  Qu Xiao-Bo    <qxb_xmu [at] yahoo.com.cn>    Aug.28,2008
%          Postal address:
% Rom 509, Scientific Research Building # 2,Haiyun Campus, Xiamen University,Xiamen,Fujian, P. R. China, 361005
% Website: http://quxiaobo.go.8866.org
%=============================================================
% References:
% [1]Qu Xiao-Bo, YAN Jing-Wen, XIAO Hong-Zhi, ZHU Zi-Qian. Image Fusion Algorithm Based on Spatial Frequency-Motivated Pulse Coupled Neural Networks in Nonsubsampled Contourlet Transform Domain. Acta Automatica Sinica, Vol.34, No.12, pp: 1508-1514.Dec.2008. 
% [2]Xiao-Bo Qu,Jingwen Yan.Image Fusion Algorithm Based on Features Motivated Multi-channel Pulse Coupled Neural Networks, The 2nd International Conference on Bioinformatics and Biomedical Engineering-iCBBE2008��Shanghai, China, 16-18 May 2008, pp. 2103-2106
% [3]Xiaobo Qu, Changwei Hu, Jingwen Yan, Image Fusion Algorithm Based On Orientation Information Motivated Pulse Coupled Neural Networks, The seventh World Congress on Intelligent Control and Automation-WCICA 2008��Chongqing, China,25-27 June 2008, pp.2437-2441
% [4]Xiaobo Qu, Jingwen Yan, Ziqian Zhu, et al. Multi-focus image fusion algorithm based on regional firing characteristic of Pulse Coupled Neural Networks, Conference Pre-proceedings of The Second International Conference on Bio-Inspired Computing: Theories and Applications, pp:563-565,2007
% [5]Yan Jingwen, QU Xiaobo. Beyond Wavelets and Its Applications [M].Beijing: National Defense Industry Press, June 2008.(In Chinese)
% (Check http://quxiaobo.go.8866.org, http://quxiaobo.blog.edu.cn or http://naec.stu.edu.cn for these and 
% other related papers.)
%=============================================================
%%
clc;
clear all;
close all;
%%
im=imread('lena.png');
%im = dicomread('E:\eos_no_result_for_Iris\15-12-09_M0982232\12-09-15_14h14m54_M0982232_face.dcm');
im=double(im);
%%
link_arrange=5;
iteration_times=10;
%%
%firing_times=PCNN_large_arrange(im,link_arrange,iteration_times);
firing_times = PCNN_ori(im,iteration_times);
%%
figure,imshow(im,[])
figure,imshow(firing_times,[])