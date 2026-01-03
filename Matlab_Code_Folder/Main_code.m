clc;
clear all;
close all

while(1)
    ch=menu('E waste  Detection using Matlab','LOAD  IMAGE','colour convertion','Boundary extraction','neural network','Final Result','exit');
if (ch==1)
    
    [file,path]=uigetfile('input\*.*');
filename=strcat(path,file);

HazeImg = imread(filename);
figure, imshow(HazeImg, []);
A=HazeImg;


end

if (ch==2)
    
    kk=im2bw(A);
    figure,imshow(kk);
    
    pause(1);
    
    kl=rgb2gray(A);
    figure,imshow(kl);
    pause(1);
    
    
    kj=rgb2hsv(A);
    figure,imshow(kj);
    
    pause(1);
    km=rgb2ycbcr(A);
    figure,imshow(km);
    
    
end

if (ch==3)
    
      I=HazeImg;
    bim=im2bw(I); 
    imshow(bim);title('Binary Image');  
    hold on
%     text(20,20,strcat('Threshold =',num2str(t)),'color','b')
se1=strel('disk',5);
se2=strel('disk',5);
  
    BW1=imdilate(bim,se1);
    BW2=imerode(bim,se2);

    B3=bwboundaries(bim);
  B2=bwboundaries(BW2);
  B1 =bwboundaries(BW1);
imshow(I);title('BOUNDARY EXTRACTION');

hold on
for k = 1:length(B3)
boundary = B3{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2.1)
end

pause(2); 
    
    
end 


if ch==4
    [Text1 ]=neuraltest(A);
end

if ch==5
    
    
    
        inputimage=HazeImg;
     c1 = recog1(inputimage); 
       c2 = recog2(inputimage);
       
       
       
       if c1 == 1
           disp('E waste ');
           msgbox('E waste ');
       end
    if c2 == 1
           disp('Normal waste ');
           msgbox('Normal waste ');
       end

    
  
    
    
       
 
    
    
end
       



if ch==6
    close all;
    clear all
    clc;
    break;
    
end 

end 