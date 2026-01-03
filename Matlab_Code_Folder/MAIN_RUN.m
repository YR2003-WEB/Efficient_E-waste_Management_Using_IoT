clc;
close all;
clear all;
obj1=instrfind('Type','serial','Port','COM4','Tag','')
% check obj is available
if isempty(obj1)
obj1 = serial('COM4');
else
fclose(obj1);
obj1 = obj1(1);
end

obj1.BaudRate = 9600;
fopen(obj1);

while(1)
    ch=menu('waste classification','load the input','apply thershold','gray level convertion','detect the boundary','clasification','upload to hardware','exit');
    
    if(ch==1)


[file path]=uigetfile('input\*.*');
filename=strcat(path,file);
    I = imread(filename);
  
    imshow(I);title('Original Image');
    end
     if(ch==2)

     g=rgb2gray(I);
    h = waitbar(0,'Applying Threshold...');

    J = I;  

    h = rgb2hsv(J);  
   
    pause(0.5);

    [m n] = size(J(:,:,1));  
    
   waitbar(.25) 
    for i = 1:m 
        for j = 1:n  
               
            for k = 1:3  
                
                
                J(i,j,k) = int8(255*h(i,j,k));  
              
            end 
            
        end  
    end  
         
    pause(0.5);
    
  
   waitbar(.75)


    waitbar(1);
    
    
    figure,imshow(h);title('HSV CONVERSION');
       pause(1);
    k=im2bw(I);
    imshow(k);
  
    
    imshow(k);title('Thershold image');
     end
    
   if(ch==3)

    
    d=rgb2gray(I);
glcm=graycomatrix(d,'Offset',[2 0;0 2]);
sat=graycoprops(glcm,'all')
x1=mean(sat.Contrast)
x3=mean(sat.Correlation)
x2=mean(sat.Energy)
x4=mean(sat.Homogeneity)

figure,imshow(d);
title('Gary scale conversion');



disp('Contrast');
disp(x1);

disp('Energy');
disp(x2);
 
disp('Correlation');
disp(x3);
 
disp('Homogeneity');
disp(x4);

    
    
  end
    
   if(ch==4)  
    
    
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
plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 5)
end

pause(2);

end
    
   if(ch==5)
inputimage= I;

  c1 = recog1(inputimage); 
       c2 = recog2(inputimage);
      

 if c1 == 1
      disp('E waste');
      msgbox('E waste');
 end
     if c2 == 1  
      disp('common waste');
      msgbox('common waste');
     end
   
   end
     if(ch==6)

         
         
if c1 == 1
 pause(1);
% send a data
fprintf(obj1,'A'); 

pause(1);
disp('uploded to hardware');
    msgbox('uploded to hardware'); 
%     disp('A');
end
 
if c2 == 1
 pause(1);
% send a data
fprintf(obj1,'B'); 

pause(1);
disp('uploded to hardware');
    msgbox('uploded to hardware');    
%       disp('B');
 end

     end
   
    
   if(ch==7)
       close all;
       clear all;
       break;
   end
   
end
