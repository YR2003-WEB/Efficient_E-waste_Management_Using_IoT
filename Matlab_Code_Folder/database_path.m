 %%%%%%%%%%%%%%%%%%    
%%need to uncomand when the values will written
% 
% % 

% 
%           global TrainDatabasePath;
%                    TrainDatabasePath = uigetdir('E:\PROJECT FOLDER\PROJECT 2024\SLM\Harini\Muthayamal\BATCH-C\C2- fruit disease\code\Training\');
%                   CreateDatabase(TrainDatabasePath);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % 
          global inputimage
% % 
% % 

% % 
% % 
      [a b]=uigetfile('*.*');
     c=strcat(b,a);   
     inputimage=imread(c);
     a=inputimage;
% %    
% %   
     c1 = recog1(inputimage); 
       c2 = recog2(inputimage);
%        c3 = recog3(inputimage);
%         c4 = recog4(inputimage);
%        c5 = recog5(inputimage);
%        c6 = recog6(inputimage);
%            c7 = recog7(inputimage);
%           c8 = recog8(inputimage);
%           c9 = recog9(inputimage);
%           c10 = recog10(inputimage);
%            c11 = recog11(inputimage);
%           c12 = recog12(inputimage);
%            c13 = recog13(inputimage);
%           c14 = recog14(inputimage);
%            c15 = recog15(inputimage);
%           c16 = recog16(inputimage);
% % %            
%   n=55;
     disp('The expression in the test file is :- ');
      if c1 == 1
      disp('AAAAA');
     end
     if c2 == 1  
      disp('BBBBBBB');
      end
%       if c3 == 1
%       disp('CCCCC');
%       end
%      if c4 == 1
%       disp('DDDDDDD');
%       end
%    if c5 == 1
%        disp('EEEEE');
%    end
%   if c6 == 1
%         disp('FFFFF');
%   end
%   if c7 == 1
%    disp('Apple RED');
%   end
%    if c8 == 1
%    disp('Apple GREEN');
%   end
%     if c9 == 1
%  disp('Orange YELLOW');
%     end
% % % % %   if c10 == 1
% % % % %   disp('Orange GREEN');
% % % % %  end
% % % % %  
% % % % % 
% % % % 
% % % %  
% % % % 
% % % % % 
% % % % %  total_matched_percentage= n + (rand(1) * 27); 
% % % % % % 
% % % % % % 
% % % % %  disp(total_matched_percentage);
% % % %  
% %  
% 
