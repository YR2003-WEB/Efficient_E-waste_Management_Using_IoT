function [text] = neuraltest(img)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


aa=imresize(img,[346,1096]);


[I a c L2 gh ]=split(aa);
   load simplefit_dataset;










disp(I);
Len=length(I);
%     close all
% imshow(aa);
LEN=length(I);
load DataBase;


% LEN=180;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
RECOG=[];


% Dlen=length(DataBase);
Dlen=540
k=1;



for i=1:LEN
    
    Test=I{i};
    %     imshow(Test);
    for j=1:Dlen
        
        
        Test2=DataBase{j};
        
        X(j)=corr2(Test,Test2);
    end
    [Res INDEX]=max(X);
    RECOG(k)=INDEX;
    k=k+1;
    disp(INDEX);
    
 
    net = newff(simplefitInputs,simplefitTargets,20);
    net = train(net,simplefitInputs,simplefitTargets);
    simplefitOutputs = sim(net,simplefitInputs);
%     [text1 text2]=test();
%     Text1=text1;
%     Text2=text2;
end
disp('Exit');

Len=length(RECOG);
Output=[];
for i=1:Len
    
    a=    RECOG(i);
    
    if (a>=1)&(a<=15)
        Output=[Output '0'];
        
    elseif (a>=16)&(a<=30)
        Output=[Output '1'];
        
    elseif (a>=31)&(a<=45)
        Output=[Output '2'];
        
    elseif (a>=46)&(a<=60)
        Output=[Output '3'];
        
    elseif (a>=61)&(a<=75)
        Output=[Output '4'];
        
    elseif (a>=76)&(a<=90)
        Output=[Output '5'];
        
    elseif  (a>=91)&(a<=105)
        Output=[Output '6'];
        
    elseif  (a>=106)&(a<=120)
        Output=[Output '7'];
        
    elseif (a>=121)&(a<=135)
        Output=[Output '8'];
        
    elseif  (a>=136)&(a<=150)
        Output=[Output '9'];
        
    elseif  (a>=151)&(a<=165)
        Output=[Output 'A'];
        
    elseif  (a>=166)&(a<=180)
        Output=[Output 'B'];
        
    elseif  (a>=181)&(a<=195)
        Output=[Output 'C'];
        
    elseif  (a>=196)&(a<=210)
        Output=[Output 'D'];
        
    elseif  (a>=211)&(a<=225)
        Output=[Output 'E'];
        
    elseif  (a>=226)&(a<=240)
        Output=[Output 'F'];
        
    elseif  (a>=241)&(a<=255)
        Output=[Output 'G'];
        
    elseif  (a>=256)&(a<=270)
        Output=[Output 'H'];
        
    elseif  (a>=271)&(a<=285)
        Output=[Output 'I'];
        
    elseif  (a>=286)&(a<=300)
        Output=[Output 'J'];
        
    elseif  (a>=301)&(a<=315)
        Output=[Output 'K'];
        
    elseif  (a>=316)&(a<=330)
        Output=[Output 'L'];
        
    elseif  (a>=331)&(a<=345)
        Output=[Output 'M'];
        
    elseif  (a>=346)&(a<=360)
        Output=[Output 'N'];
        
    elseif  (a>=361)&(a<=375)
        Output=[Output 'O'];
        
    elseif  (a>=376)&(a<=390)
        Output=[Output 'P'];
        
    elseif  (a>=391)&(a<=405)
        Output=[Output 'Q'];
        
    elseif  (a>=406)&(a<=420)
        Output=[Output 'R'];
        
    elseif  (a>=421)&(a<=435)
        Output=[Output 'S'];
        
    elseif  (a>=436)&(a<=450)
        Output=[Output 'T'];
        
    elseif  (a>=451)&(a<=465)
        Output=[Output 'U'];
        
    elseif  (a>=466)&(a<=480)
        Output=[Output 'V'];
        
    elseif  (a>=481)&(a<=495)
        Output=[Output 'W'];
        
    elseif  (a>=496)&(a<=510)
        Output=[Output 'X'];
        
    elseif  (a>=511)&(a<=525)
        Output=[Output 'Y'];
        
    elseif  (a>=526)&(a<=540)
        Output=[Output 'Z'];
    end
    
end


text=Output;
end

