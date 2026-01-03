% %%初始部分，读取图像及计算相关信息
% 
% clear;
% close all;
% clc;
% 
% %format long;
% 
% I=imread('Lenna.bmp');
% 
% 
% %windowsize=3;
% I_temp=I;
% for i=2:255
%     for j=2:255
%         I_temp(i,j)=round(mean2(I(i-1:i+1,j-1:j+1)));
%     end
% end
% I_average=I_temp;
% 
% 
% I_p=I;
% I_average_p=I_average;
% hist_2d(1:256,1:256)=zeros(256,256);
% for i=1:256
%     for j=1:256
%         hist_2d(I_p(i,j),I_average_p(i,j))=hist_2d(I_p(i,j),I_average_p(i,j))+1;
%     end
% end
% 
% total=256*256;
% 
% hist_2d_1=hist_2d/total;
% 
% 
% %%%%%%