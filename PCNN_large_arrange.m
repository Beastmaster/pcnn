function R=PCNN_large_arrange(matrix,link_arrange,np,pre_flag)
% R=PCNN_large_arrange(matrix,link_arrange,np,pre_flag)
% compute the fire times of each pixel in the PCNN 
% np is the iterative times
% R is the fire times of coefficients of wavelet decomposition
% ---------
% Author:  Qu Xiao-Bo    <qxb_xmu [at] yahoo.com.cn>    Aug.28,2008
%          Postal address:
% Rom 509, Scientific Research Building # 2,Haiyun Campus, Xiamen University,Xiamen,Fujian, P. R. China, 361005
% Website: http://quxiaobo.go.8866.org
%=============================================================
% References:
% [1]Qu Xiao-Bo, YAN Jing-Wen, XIAO Hong-Zhi, ZHU Zi-Qian. Image Fusion Algorithm Based on Spatial Frequency-Motivated Pulse Coupled Neural Networks in Nonsubsampled Contourlet Transform Domain. Acta Automatica Sinica, Vol.34, No.12, pp: 1508-1514.Dec.2008. 
% [2]Xiao-Bo Qu,Jingwen Yan.Image Fusion Algorithm Based on Features Motivated Multi-channel Pulse Coupled Neural Networks, The 2nd International Conference on Bioinformatics and Biomedical Engineering-iCBBE2008£¬Shanghai, China, 16-18 May 2008, pp. 2103-2106
% [3]Xiaobo Qu, Changwei Hu, Jingwen Yan, Image Fusion Algorithm Based On Orientation Information Motivated Pulse Coupled Neural Networks, The seventh World Congress on Intelligent Control and Automation-WCICA 2008£¬Chongqing, China,25-27 June 2008, pp.2437-2441
% [4]Xiaobo Qu, Jingwen Yan, Ziqian Zhu, et al. Multi-focus image fusion algorithm based on regional firing characteristic of Pulse Coupled Neural Networks, Conference Pre-proceedings of The Second International Conference on Bio-Inspired Computing: Theories and Applications, pp:563-565,2007
% [5]Yan Jingwen, QU Xiaobo. Beyond Wavelets and Its Applications [M].Beijing: National Defense Industry Press, June 2008.(In Chinese)
% (Check http://quxiaobo.go.8866.org, http://quxiaobo.blog.edu.cn or http://naec.stu.edu.cn for these and 
% other related papers.)
%=============================================================
disp('PCNN is processing...')
[p,q]=size(matrix);
% computes the normalized matrix of the matrixA and  matrixB
F_NA=Normalized(matrix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize the parameters. 
% Youd better change them according to your applications 
alpha_L=1;
alpha_Theta=0.2;
 beta=3;
vL=1.00;
vTheta=20;
% Generate the null matrix that could be used
L=zeros(p,q);
U=zeros(p,q);
Y=zeros(p,q);
Y0=zeros(p,q);
Theta=zeros(p,q);
% Compute the linking strength.
center_x=round(link_arrange/2);
center_y=round(link_arrange/2);
W=zeros(link_arrange,link_arrange);
for i=1:link_arrange
    for j=1:link_arrange
        if (i==center_x)&&(j==center_y)
            W(i,j)=0;
        else
            W(i,j)=1./sqrt((i-center_x).^2+(j-center_y).^2); % convolve kernel
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=F_NA;
for n=1:np
    K=conv2(Y,W,'same');
    L=exp(-alpha_L)*L+vL*K;
    Theta=exp(-alpha_Theta)*Theta+vTheta*Y;
    U=F.*(1+beta*L);
    Y=im2double(U>Theta);
    Y0=Y0+Y;   
end
R=Y0;

end

function [normalized_matrix,cmin,cmax]=Normalized(matrix)
input_matrix=abs(matrix);
Max_input=max(input_matrix(:));
Min_input=min(input_matrix(:));
min_matrix=ones(size(input_matrix)).*Min_input;
normalized_matrix=(input_matrix-min_matrix)./(Max_input-Min_input+eps);
cmin=Min_input;
cmax=Max_input;
end

