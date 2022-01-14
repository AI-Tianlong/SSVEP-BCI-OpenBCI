Screen('Preference','SkipSyncTests', 1);
Screen('Preference', 'ConserveVRAM', 64); 
Screen('Preference','VisualDebugLevel',0);%取消了开头的那个三角形动画
% 设置屏幕，这两句话通常写在主函数前面的，这里为了方便大家运行可以直接拷贝
% 以下是单个trail里的显示内容

% HideCursor;%隐藏光标
[w,wrct] = Screen('OpenWindow',0); %1为实验室外接屏幕，2为电脑自带屏幕,0为两个屏幕同时显示   0 1 2自己都改着试试
wrct; %笔记本为1920*1080  实验室台式机为1600*900   所以 要设计一个 自主规划的程序
%打开窗口，全屏
Screen('FillRect',w,0);
%创建黑屏
if wrct == [0 0 1600 900]
    side=135;%方块的边长
    jiangex=22;
    jiangey=30;
    Screen('TextSize', w,100);
elseif wrct == [0 0 1920 1080]
    side=250;
    jiangex=22;
    jiangey=40;
    Screen('TextSize', w,170);
end

% %限制刷新率为60Hz   不行，有问题
% res=Screen('Resolutions',1);
% for i=length(res):-1:1
%     fprintf('%dX%d,,%d,%d\n',res(i).width,res(i).height,res(i).hz,res(i).pixelSize)
% end
% oldResolution=Screen('Resolution',1,1920,1080,75,32);

ifi = Screen('GetFlipInterval', w);
time=0;
topPriorityLevel = MaxPriority(w);
Priority(topPriorityLevel);            %优先级设置为最高

%Screen('DrawText',w,'↑',835,40,0)

%%%%%%%%%%%%%%%%%%%%%%初始化显示 全亮开
% if wrct==[0 0 1600 900]
%     Screen('FillRect',w,255, [(wrct(3)-side)/2,40,(wrct(3)-side)/2+side,40+side]); 
%     Screen('FillRect',w,255, [(wrct(3)-side)/2,wrct(4)-40-side,(wrct(3)-side)/2+side,wrct(4)-40]); 
%     Screen('FillRect',w,255, [40,(wrct(4)-side)/2,40+side,(wrct(4)-side)/2+side]); 
%     Screen('FillRect',w,255, [wrct(3)-40-side,(wrct(4)-side)/2,wrct(3)-40,(wrct(4)-side)/2+side]); 
%     Screen('FillRect',w,255, [175+7*jiangex+7*side,30+4*side+4*jiangey,40+175+7*jiangex+9*side,30+5*side+4*jiangey]); 
%     显示文字
%     Screen('DrawText',w,'↑',42+(wrct(3)-side)/2,20+40,0); 
%     Screen('DrawText',w,'↓',42+(wrct(3)-side)/2,20 +wrct(4)-40-side); 
%     Screen('DrawText',w,'←',20+40,50+(wrct(4)-side)/2,0); 
%     Screen('DrawText',w,'→',20+wrct(3)-40-side,50+(wrct(4)-side)/2,0); 
%     Screen('DrawText',w,'Catch',200+7*jiangex+7*side,60+4*side+4*jiangey,0); 
if wrct==[0 0 1920 1080]
    Screen('FillRect',w,255, [(wrct(3)-side)/2,40,(wrct(3)-side)/2+side,40+side]); 
    Screen('FillRect',w,255, [(wrct(3)-side)/2,wrct(4)-40-side,(wrct(3)-side)/2+side,wrct(4)-40]); 
    Screen('FillRect',w,255, [40,(wrct(4)-side)/2,40+side,(wrct(4)-side)/2+side]); 
    Screen('FillRect',w,255, [wrct(3)-40-side,(wrct(4)-side)/2,wrct(3)-40,(wrct(4)-side)/2+side]); 
    Screen('FillRect',w,255, [175+7*jiangex+7*side,30+4*side+4*jiangey,40+175+7*jiangex+9*side,30+5*side+4*jiangey]); 
    
    Screen('DrawText',w,'↑',80+(wrct(3)-side)/2,80,0); 
    Screen('DrawText',w,'↓',80+(wrct(3)-side)/2,85+wrct(4)-80-side); 
    Screen('DrawText',w,'←',40+40,90+(wrct(4)-side)/2,0); 
    Screen('DrawText',w,'→',40+wrct(3)-40-side,90+(wrct(4)-side)/2,0); 
    Screen('DrawText',w,'Catch',210+7*jiangex+7*side,70+4*side+4*jiangey,0); 
end
%%%%%%%%%%%%%%%%%%%%%%引导语，按下任何键开启
if wrct == [0 0 1600 900]
    aaarect=[0 0 700 400];
elseif wrct == [0 0 1920 1080]
    aaarect=[0 0 820 400];
end
Screen('TextSize', w,120);
[xpos,ypos] = RectCenter(wrct);
newrect=CenterRectOnPoint(aaarect,xpos,ypos);
Screen('FillRect',w,100,newrect);
Screen('DrawText',w,'Press Any Key',20+newrect(1),80+newrect(2),[255,215,0]);
Screen('DrawText',w,'To Start Test',50+newrect(1),220+newrect(2),[255,215,0]);
Screen('Flip',w); 
   
while 1
    if KbCheck
    %%%%%%%%%%%%%%%%%%%%%
        WaitSecs(0.5);
        vbl = Screen('Flip',w);       %vbl存的第一次刷新屏幕的时间
        waitframes = 1;
        FrameNum=0;
%         if wrct==[0 0 1600 900]
%             while  ~KbCheck   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始闪烁
% %                 Screen('FillRect',w,flicker(8.0,FrameNum,0.0*pi,ifi),[(wrct(3)-side)/2,40,(wrct(3)-side)/2+side,40+side]); 
% %                 Screen('FillRect',w,flicker(10.0,FrameNum,0.0*pi,ifi),[(wrct(3)-side)/2,wrct(4)-40-side,(wrct(3)-side)/2+side,wrct(4)-40]); 
% %                 Screen('FillRect',w,flicker(12.0,FrameNum,0.0*pi,ifi),[40,(wrct(4)-side)/2,40+side,(wrct(4)-side)/2+side]); 
%                 Screen('FillRect',w,flicker(14.0,FrameNum,0.0*pi,ifi),[wrct(3)-40-side,(wrct(4)-side)/2,wrct(3)-40,(wrct(4)-side)/2+side]); 
% %                 Screen('FillRect',w,flicker(16.0,FrameNum,0.0*pi,ifi),[175+7*jiangex+7*side,30+4*side+4*jiangey,40+175+7*jiangex+9*side,30+5*side+4*jiangey]); 
%                 % 显示文字
% %                 Screen('DrawText',w,'↑',42+(wrct(3)-side)/2,20+40,0); 
% %                 Screen('DrawText',w,'↓',42+(wrct(3)-side)/2,20 +wrct(4)-40-side); 
% %                 Screen('DrawText',w,'←',20+40,50+(wrct(4)-side)/2,0); 
%                 Screen('DrawText',w,'→',20+wrct(3)-40-side,50+(wrct(4)-side)/2,0); 
% %                 Screen('DrawText',w,'Catch',200+7*jiangex+7*side,60+4*side+4*jiangey,0); 
%                 vbl  = Screen('Flip', w);
%                 FrameNum=FrameNum+1;
%             end
       if wrct==[0 0 1920 1080]
           Screen('TextSize', w,170);
            while  ~KbCheck   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始闪烁
                Screen('FillRect',w,flicker(8.0,FrameNum,0.0*pi,ifi),[(wrct(3)-side)/2,40,(wrct(3)-side)/2+side,40+side]); 
                Screen('FillRect',w,flicker(10.0,FrameNum,0.5*pi,ifi),[(wrct(3)-side)/2,wrct(4)-40-side,(wrct(3)-side)/2+side,wrct(4)-40]); 
                Screen('FillRect',w,flicker(12.0,FrameNum,1.0*pi,ifi),[40,(wrct(4)-side)/2,40+side,(wrct(4)-side)/2+side]); 
                Screen('FillRect',w,flicker(15.8,FrameNum,1.5*pi,ifi),[wrct(3)-40-side,(wrct(4)-side)/2,wrct(3)-40,(wrct(4)-side)/2+side]); 
%                 Screen('FillRect',w,flicker(12.0,FrameNum,0.0*pi,ifi),[175+7*jiangex+7*side,30+4*side+4*jiangey,40+175+7*jiangex+9*side,30+5*side+4*jiangey]); 
%                 显示文字
                Screen('DrawText',w,'↑',80+(wrct(3)-side)/2,80,0); 
                Screen('DrawText',w,'↓',80+(wrct(3)-side)/2,85+wrct(4)-80-side); 
                Screen('DrawText',w,'←',40+40,90+(wrct(4)-side)/2,0); 
                Screen('DrawText',w,'→',40+wrct(3)-40-side,90+(wrct(4)-side)/2,0); 
%                 Screen('DrawText',w,'Catch',210+7*jiangex+7*side,70+4*side+4*jiangey,0); 
                vbl  = Screen('Flip', w);
                FrameNum=FrameNum+1;
            end
        end 
        ShowCursor;  %显示光标  
        Screen('CloseAll');
        break;
    end
end
     
%  % 按任意键继续
    
    %结束，关闭屏幕