function [I a s12 L2 labe]=split(a)
% a=imread('real12.bmp');
% imshow(a);
[r c p]=size(a);
if p==3
    a=rgb2gray(a);
end
%   imshow(a);
% pixval on;
aaa=a;
% a=im2double(a);
for i=1:r
    for j=1:c
        dd=a(i,j);
        if dd >145
        Out(i,j)=255;        
    else
        Out(i,j)=0;
    end
        
    end
end
a=Out;



% pixval on;
 b=im2bw(a);
   se1 = strel('line',3,0);
        se2 = strel('line',3,90);
        composition = imdilate(b,[se1 se2],'full')
c=imcomplement(b);
s12=c;
[L num]=bwlabel(c);
STATS = regionprops(L,'all');
disp(num);
% close all;

removed=0;
for i=1:num
dd=STATS(i).Area;
if dd < 3000
  	L(L==i)=0;
	removed = removed + 1;
    num=num-1;
else
% imshow(L==i);
end
    
    
end
    disp(num);
    [L1 num1]=bwlabel(L);
labe=L1;
% for i=1:num1
% %  	figure
% % 	
% %  	imshow(L1==i);
% 
% end
  disp(num1);
%   close all;
  
  [L2 num2]=bwlabel(L1);
      STATS = regionprops(L1,'Area');
      
      Data=[];
		for i=1:num2
		Data1=STATS(i).Area
		
		Data=[Data Data1];
		
		end
        
        Data2=-sort(-Data);
        
%         Data3=Data2(1:9);
        
%         L = bwlabel(BW,4);
%         [r,c] = find(L == 2);

% AreaData=min(Data3);
% removed=0;
% for i=1:num
% dd=STATS(i).Area;
% if dd < AreaData
%   	L(L==i)=0;
% 	removed = removed + 1;
%     num=num-1;
% else
% % imshow(L==i);
% end
%     
%     
% end
%         
% removed=0;
% count=0;
%   count2=0;
% for i=1:num
%   
% dd=STATS(i).Area;
% 
%     for j=1:9
%         dd1=Data3(j);
%         if dd1~=dd
%             count=count+1;
%         
%            
%         end
%    end
%         if count==9
%           	L1(L1==i)=0;
%         	removed = removed + 1;
%             num=num-1;
%         end
% 
%        
% %        if count2==9
% %            
% %            break;
% %        end
% end
% 
% 
% disp(L);

 [L2 num2]=bwlabel(L2);
 disp(num2);
  
stats1 = regionprops(L2, 'Image'); % get image features
C = [];
str='.bmp';
for j=1:1:(num2)
    c = stats1(j);
    C{j} = [c.Image]; % sepreate diffrent objects into C cell array.
%     C{j} = imresize(C{j}, [45 24], 'bilinear'); % resize objects for SVM
    EE = imresize(C{j}, [45 24]);
%     figure;
% imshow(EE,[]);
    EE=imcomplement(EE);
%        imshow(EE,[]);
     C{j}=EE;
%     ee=uint8(EE);
    [r c]=size(EE);
    dd=zeros(r,c);

end
I=C;

