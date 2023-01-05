
Screen('Preference','SkipSyncTests', 1);  
Screen('Preference', 'ConserveVRAM', 64); 
Screen('Preference','VisualDebugLevel',0);%取消了开头的那个三角形动画
% 设置屏幕，这两句话通常写在主函数前面的，这里为了方便大家运行可以直接拷贝
% 以下是单个trail里的显示内容
ScreenNum=Screen('Screens');  
%HideCursor;%隐藏光标
%%
[w,wrct] = Screen('OpenWindow',0); %1为实验室外接屏幕，2为电脑自带屏幕,0为两个屏幕同时显示
wrct; %笔记本为1920*1080  实验室台式机为1600*900   所以 要设计一个 自主规划的程序
%打开窗口，全屏
Screen('FillRect',w,0);
%创建黑屏`
if wrct == [0 0 1600 900]
    side=135;%方块的边长
    jiangex=22;
    jiangey=30;
    Screen('TextSize', w,100);
elseif wrct == [0 0 1920 1080]
    side=170;
    jiangex=22;
    jiangey=40;
    Screen('TextSize', w,85);
%     Screen('TextFont', w,'Consolas');
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

%% %%%%%%%%%%%%%%%%%%%%初始化显示 全亮开
%% %%%方块显示
            Screen('FrameRect',w,255,[15,30,13+9*jiangex+10*side,30+side],3);%%%%文本的输入框
            Screen('FillRect',w,255,[20+9*jiangex+9*side,33,10+9*jiangex+10*side,27+side]);
            %第一行方块
            Screen('FillRect',w,255,[20+0*jiangex+0*side,30+side+jiangey,20+0*jiangex+side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+1*jiangex+1*side,30+side+jiangey,20+1*jiangex+2*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+2*jiangex+2*side,30+side+jiangey,20+2*jiangex+3*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+3*jiangex+3*side,30+side+jiangey,20+3*jiangex+4*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+4*jiangex+4*side,30+side+jiangey,20+4*jiangex+5*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+5*jiangex+5*side,30+side+jiangey,20+5*jiangex+6*side,30+2*side+jiangey]);  
            Screen('FillRect',w,255, [20+6*jiangex+6*side,30+side+jiangey,20+6*jiangex+7*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+7*jiangex+7*side,30+side+jiangey,20+7*jiangex+8*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+8*jiangex+8*side,30+side+jiangey,20+8*jiangex+9*side,30+2*side+jiangey]); 
            Screen('FillRect',w,255, [20+9*jiangex+9*side,30+side+jiangey,20+9*jiangex+10*side,30+2*side+jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第2行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,255, [20+0*jiangex+0*side,30+2*side+2*jiangey,20+0*jiangex+1*side,30+3*side+2*jiangey]);     
            Screen('FillRect',w,255, [20+1*jiangex+1*side,30+2*side+2*jiangey,20+1*jiangex+2*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+2*jiangex+2*side,30+2*side+2*jiangey,20+2*jiangex+3*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+3*jiangex+3*side,30+2*side+2*jiangey,20+3*jiangex+4*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+4*jiangex+4*side,30+2*side+2*jiangey,20+4*jiangex+5*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+5*jiangex+5*side,30+2*side+2*jiangey,20+5*jiangex+6*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+6*jiangex+6*side,30+2*side+2*jiangey,20+6*jiangex+7*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+7*jiangex+7*side,30+2*side+2*jiangey,20+7*jiangex+8*side,30+3*side+2*jiangey]);      
            Screen('FillRect',w,255, [20+8*jiangex+8*side,30+2*side+2*jiangey,20+8*jiangex+9*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,255, [20+9*jiangex+9*side,30+2*side+2*jiangey,20+9*jiangex+10*side,30+3*side+2*jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第3行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,255, [20+0*jiangex+0*side,30+3*side+3*jiangey,20+0*jiangex+1*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+1*jiangex+1*side,30+3*side+3*jiangey,20+1*jiangex+2*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+2*jiangex+2*side,30+3*side+3*jiangey,20+2*jiangex+3*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+3*jiangex+3*side,30+3*side+3*jiangey,20+3*jiangex+4*side,30+4*side+3*jiangey]);      
            Screen('FillRect',w,255, [20+4*jiangex+4*side,30+3*side+3*jiangey,20+4*jiangex+5*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+5*jiangex+5*side,30+3*side+3*jiangey,20+5*jiangex+6*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+6*jiangex+6*side,30+3*side+3*jiangey,20+6*jiangex+7*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+7*jiangex+7*side,30+3*side+3*jiangey,20+7*jiangex+8*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,255, [20+8*jiangex+8*side,30+3*side+3*jiangey,20+8*jiangex+9*side,30+4*side+3*jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第4行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,255, [20+0*jiangex+0*side,30+4*side+4*jiangey,20+0*jiangex+1*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+1*jiangex+1*side,30+4*side+4*jiangey,20+1*jiangex+2*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+2*jiangex+2*side,30+4*side+4*jiangey,20+2*jiangex+3*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+3*jiangex+3*side,30+4*side+4*jiangey,20+3*jiangex+4*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+4*jiangex+4*side,30+4*side+4*jiangey,20+4*jiangex+5*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+5*jiangex+5*side,30+4*side+4*jiangey,20+5*jiangex+6*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+6*jiangex+6*side,30+4*side+4*jiangey,20+6*jiangex+7*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,255, [20+7*jiangex+7*side,30+4*side+4*jiangey,20+8*jiangex+9*side,30+5*side+4*jiangey]); 
%% 显示文字
%% 显示文字
            Screen('TextSize', w,65);
            Screen('DrawText',w,'>',25,100,255); %
            Screen('DrawText',w,'Back',26+9*jiangex+9*side,90,0);%Back
            Screen('TextSize', w,85);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第1行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'1',80+0*jiangex+0*side,80+side+jiangey,0); 
            Screen('DrawText',w,'2',80+1*jiangex+1*side,80+side+jiangey,0); 
            Screen('DrawText',w,'3',80+2*jiangex+2*side,80+side+jiangey,0); 
            Screen('DrawText',w,'4',80+3*jiangex+3*side,80+side+jiangey,0); 
            Screen('DrawText',w,'5',80+4*jiangex+4*side,80+side+jiangey,0); 
            Screen('DrawText',w,'6',80+5*jiangex+5*side,80+side+jiangey,0);  
            Screen('DrawText',w,'7',80+6*jiangex+6*side,80+side+jiangey,0); 
            Screen('DrawText',w,'8',80+7*jiangex+7*side,80+side+jiangey,0); 
            Screen('DrawText',w,'9',80+8*jiangex+8*side,80+side+jiangey,0); 
            Screen('DrawText',w,'0',80+9*jiangex+9*side,80+side+jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第2行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'Q',75+0*jiangex+0*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'W',75+1*jiangex+1*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'E',75+2*jiangex+2*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'R',75+3*jiangex+3*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'T',75+4*jiangex+4*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'Y',75+5*jiangex+5*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'U',75+6*jiangex+6*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'I',90+7*jiangex+7*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'O',75+8*jiangex+8*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'P',75+9*jiangex+9*side,80+2*side+2*jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第3行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'A',75+0*jiangex+0*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'S',75+1*jiangex+1*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'D',75+2*jiangex+2*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'F',75+3*jiangex+3*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'G',75+4*jiangex+4*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'H',75+5*jiangex+5*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'J',75+6*jiangex+6*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'K',75+7*jiangex+7*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'L',75+8*jiangex+8*side,80+3*side+3*jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第4行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'Z',75+0*jiangex+0*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'X',75+1*jiangex+1*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'C',75+2*jiangex+2*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'V',75+3*jiangex+3*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'B',75+4*jiangex+4*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'N',75+5*jiangex+5*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'M',70+6*jiangex+6*side,80+4*side+4*jiangey,0); 
            %Screen('TextSize', w,90);
            Screen('DrawText',w,'Space',80+7*jiangex+7*side,80+4*side+4*jiangey,0); 
%%

%%%%%%%%%%%%%%%%%%%%%%引导语，按下任何键开启
if wrct == [0 0 1600 900]
    aaarect=[0 0 700 400];
elseif wrct == [0 0 1920 1080]
    aaarect=[0 0 820 400];
end
[xpos,ypos] = RectCenter(wrct);
newrect=CenterRectOnPoint(aaarect,xpos,ypos);
Screen('TextSize', w,120);
Screen('FillRect',w,100,newrect);
Screen('DrawText',w,'Press Any Key',20+newrect(1),80+newrect(2),[255,215,0]);
Screen('DrawText',w,'To Start Test',50+newrect(1),220+newrect(2),[255,215,0]);
Screen('Flip',w); 
   %%
while 1
    FrameNum=0;  %用来计算 帧，用来计算，没刷新一次，算一帧，i*刷新一帧的时间=sin的t
    if KbCheck
    %%%%%%%%%%%%%%%%%%%%%
        WaitSecs(0.1);
        waitframes = 1;
        vbl = Screen('Flip',w);    %vbl存的第一次刷新屏幕的时间
        while ~KbCheck   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始闪烁
            %[secs,keycode]=KbPressWait;
            Screen('FrameRect',w,255,[15,30,13+9*jiangex+10*side,30+side],3);%%%%文本的输入框
            Screen('FillRect',w,flicker(15.6,FrameNum,0.13*pi,ifi),[20+9*jiangex+9*side,33,10+9*jiangex+10*side,27+side]);
            %第一行方块
            Screen('FillRect',w,flicker(8.0,FrameNum,0.0*pi,ifi),[20+0*jiangex+0*side,30+side+jiangey,20+0*jiangex+side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(8.8,FrameNum,0.0*pi,ifi), [20+1*jiangex+1*side,30+side+jiangey,20+1*jiangex+2*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(9.6,FrameNum,0.0*pi,ifi), [20+2*jiangex+2*side,30+side+jiangey,20+2*jiangex+3*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(10.4,FrameNum,0.0*pi,ifi), [20+3*jiangex+3*side,30+side+jiangey,20+3*jiangex+4*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(11.2,FrameNum,0.0*pi,ifi), [20+4*jiangex+4*side,30+side+jiangey,20+4*jiangex+5*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(12.0,FrameNum,0.0*pi,ifi), [20+5*jiangex+5*side,30+side+jiangey,20+5*jiangex+6*side,30+2*side+jiangey]);  
            Screen('FillRect',w,flicker(12.8,FrameNum,0.0*pi,ifi), [20+6*jiangex+6*side,30+side+jiangey,20+6*jiangex+7*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(13.6,FrameNum,0.0*pi,ifi), [20+7*jiangex+7*side,30+side+jiangey,20+7*jiangex+8*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(14.4,FrameNum,0.0*pi,ifi), [20+8*jiangex+8*side,30+side+jiangey,20+8*jiangex+9*side,30+2*side+jiangey]); 
            Screen('FillRect',w,flicker(15.2,FrameNum,0.0*pi,ifi), [20+9*jiangex+9*side,30+side+jiangey,20+9*jiangex+10*side,30+2*side+jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第2行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,flicker(8.2,FrameNum,0.5*pi,ifi), [20+0*jiangex+0*side,30+2*side+2*jiangey,20+0*jiangex+1*side,30+3*side+2*jiangey]);     
            Screen('FillRect',w,flicker(9.0,FrameNum,0.5*pi,ifi), [20+1*jiangex+1*side,30+2*side+2*jiangey,20+1*jiangex+2*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(9.8,FrameNum,0.5*pi,ifi), [20+2*jiangex+2*side,30+2*side+2*jiangey,20+2*jiangex+3*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(10.6,FrameNum,0.5*pi,ifi), [20+3*jiangex+3*side,30+2*side+2*jiangey,20+3*jiangex+4*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(11.4,FrameNum,0.5*pi,ifi), [20+4*jiangex+4*side,30+2*side+2*jiangey,20+4*jiangex+5*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(12.2,FrameNum,0.5*pi,ifi), [20+5*jiangex+5*side,30+2*side+2*jiangey,20+5*jiangex+6*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(13.0,FrameNum,0.5*pi,ifi), [20+6*jiangex+6*side,30+2*side+2*jiangey,20+6*jiangex+7*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(13.8,FrameNum,0.5*pi,ifi), [20+7*jiangex+7*side,30+2*side+2*jiangey,20+7*jiangex+8*side,30+3*side+2*jiangey]);      
            Screen('FillRect',w,flicker(14.6,FrameNum,0.5*pi,ifi), [20+8*jiangex+8*side,30+2*side+2*jiangey,20+8*jiangex+9*side,30+3*side+2*jiangey]); 
            Screen('FillRect',w,flicker(15.4,FrameNum,0.5*pi,ifi), [20+9*jiangex+9*side,30+2*side+2*jiangey,20+9*jiangex+10*side,30+3*side+2*jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第3行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,flicker(8.4,FrameNum,1*pi,ifi), [20+0*jiangex+0*side,30+3*side+3*jiangey,20+0*jiangex+1*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(9.2,FrameNum,1*pi,ifi), [20+1*jiangex+1*side,30+3*side+3*jiangey,20+1*jiangex+2*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(10.0,FrameNum,1*pi,ifi), [20+2*jiangex+2*side,30+3*side+3*jiangey,20+2*jiangex+3*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(10.8,FrameNum,1*pi,ifi), [20+3*jiangex+3*side,30+3*side+3*jiangey,20+3*jiangex+4*side,30+4*side+3*jiangey]);      
            Screen('FillRect',w,flicker(11.6,FrameNum,1*pi,ifi), [20+4*jiangex+4*side,30+3*side+3*jiangey,20+4*jiangex+5*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(12.4,FrameNum,1*pi,ifi), [20+5*jiangex+5*side,30+3*side+3*jiangey,20+5*jiangex+6*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(13.2,FrameNum,1*pi,ifi), [20+6*jiangex+6*side,30+3*side+3*jiangey,20+6*jiangex+7*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(14.0,FrameNum,1*pi,ifi), [20+7*jiangex+7*side,30+3*side+3*jiangey,20+7*jiangex+8*side,30+4*side+3*jiangey]); 
            Screen('FillRect',w,flicker(14.8,FrameNum,1*pi,ifi), [20+8*jiangex+8*side,30+3*side+3*jiangey,20+8*jiangex+9*side,30+4*side+3*jiangey]); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第4行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('FillRect',w,flicker(8.6,FrameNum,1.5*pi,ifi), [20+0*jiangex+0*side,30+4*side+4*jiangey,20+0*jiangex+1*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(9.4,FrameNum,1.5*pi,ifi), [20+1*jiangex+1*side,30+4*side+4*jiangey,20+1*jiangex+2*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(10.2,FrameNum,1.5*pi,ifi), [20+2*jiangex+2*side,30+4*side+4*jiangey,20+2*jiangex+3*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(11.0,FrameNum,1.5*pi,ifi), [20+3*jiangex+3*side,30+4*side+4*jiangey,20+3*jiangex+4*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(11.8,FrameNum,1.5*pi,ifi), [20+4*jiangex+4*side,30+4*side+4*jiangey,20+4*jiangex+5*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(12.6,FrameNum,1.5*pi,ifi), [20+5*jiangex+5*side,30+4*side+4*jiangey,20+5*jiangex+6*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(13.4,FrameNum,1.5*pi,ifi), [20+6*jiangex+6*side,30+4*side+4*jiangey,20+6*jiangex+7*side,30+5*side+4*jiangey]); 
            Screen('FillRect',w,flicker(14.2,FrameNum,1.5*pi,ifi), [20+7*jiangex+7*side,30+4*side+4*jiangey,20+8*jiangex+9*side,30+5*side+4*jiangey]); 


            %% 显示文字
            Screen('TextSize', w,65);
            Screen('DrawText',w,'>',25,100,255); %
            Screen('DrawText',w,'Back',26+9*jiangex+9*side,90,0);%Back
            Screen('TextSize', w,85);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%第1行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'1',80+0*jiangex+0*side,80+side+jiangey,0); 
            Screen('DrawText',w,'2',80+1*jiangex+1*side,80+side+jiangey,0); 
            Screen('DrawText',w,'3',80+2*jiangex+2*side,80+side+jiangey,0); 
            Screen('DrawText',w,'4',80+3*jiangex+3*side,80+side+jiangey,0); 
            Screen('DrawText',w,'5',80+4*jiangex+4*side,80+side+jiangey,0); 
            Screen('DrawText',w,'6',80+5*jiangex+5*side,80+side+jiangey,0);  
            Screen('DrawText',w,'7',80+6*jiangex+6*side,80+side+jiangey,0); 
            Screen('DrawText',w,'8',80+7*jiangex+7*side,80+side+jiangey,0); 
            Screen('DrawText',w,'9',80+8*jiangex+8*side,80+side+jiangey,0); 
            Screen('DrawText',w,'0',80+9*jiangex+9*side,80+side+jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第2行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'Q',75+0*jiangex+0*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'W',75+1*jiangex+1*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'E',75+2*jiangex+2*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'R',75+3*jiangex+3*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'T',75+4*jiangex+4*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'Y',75+5*jiangex+5*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'U',75+6*jiangex+6*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'I',90+7*jiangex+7*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'O',75+8*jiangex+8*side,80+2*side+2*jiangey,0); 
            Screen('DrawText',w,'P',75+9*jiangex+9*side,80+2*side+2*jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第3行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'A',75+0*jiangex+0*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'S',75+1*jiangex+1*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'D',75+2*jiangex+2*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'F',75+3*jiangex+3*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'G',75+4*jiangex+4*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'H',75+5*jiangex+5*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'J',75+6*jiangex+6*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'K',75+7*jiangex+7*side,80+3*side+3*jiangey,0); 
            Screen('DrawText',w,'L',75+8*jiangex+8*side,80+3*side+3*jiangey,0); 
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%第4行%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Screen('DrawText',w,'Z',75+0*jiangex+0*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'X',75+1*jiangex+1*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'C',75+2*jiangex+2*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'V',75+3*jiangex+3*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'B',75+4*jiangex+4*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'N',75+5*jiangex+5*side,80+4*side+4*jiangey,0); 
            Screen('DrawText',w,'M',70+6*jiangex+6*side,80+4*side+4*jiangey,0); 
            %Screen('TextSize', w,90);
            Screen('DrawText',w,'Space',80+7*jiangex+7*side,80+4*side+4*jiangey,0); 
            %%
            vbl = Screen('Flip', w);
            FrameNum=FrameNum+1;
        end
        ShowCursor;  %显示光标  
        Screen('CloseAll');
        break;
    end
end
   
%  % 按任意键继续
    
    %结束，关闭屏幕
