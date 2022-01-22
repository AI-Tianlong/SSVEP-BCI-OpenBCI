%% 程序说明
% 该程序为SSVEP的在线分析程序
% 该程序包含完整的信号采集、信号预处理、SSVEP信号的识别
% 
% 程序流程如下：
% 笔记本电脑蓝牙连接蓝牙小车的HC-05模块-->依靠LSL实时获取OpenBCI传来的数据-->脑电信号处理(sig_pro_all函数)-->
% -->判断诱发SSVEP的刺激频率并控制小车运动
% 
%% 以下为程序
close all
clc
%% 连接蓝牙小车的HC-05蓝牙模块
% 注意该代码块只能执行一次，执行一次后屏蔽掉，否则第二次执行程序会报错！
clear all                   % 只能执行一次！！！！,执行之后屏蔽掉该代码块！
B=Bluetooth('ssvep',1);     % 这里去选择你自己的HC-05模块
fopen(B);
disp('小车蓝牙已连接成功');
% 10前进，20右转，30左转，40后退

%% LSL 接受从OpenBCI传回来的数据
disp('Loading the library...');
lib = lsl_loadlib();
% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end
% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});
[vec,ts] = inlet.pull_sample();
disp('成功接收到数据...');
fprintf('%.2f\t\t',vec);
fprintf('\n');
start = ts;
eeg_record = [];
EEG_DATA = [];

for i=1:4    %修改trail次数
    while ts - start < 4    %修改每一个trail采集信号的时长
        [vec,ts] = inlet.pull_sample();
        eeg_record = [eeg_record; vec];  %一数列是一个通道
        %fprintf('%.2f\t\t',vec);
        %fprintf('\n');       
    end
   %% 将在线分析采集的数据存为csv文件，以供离线分析，在实际在线分析的时候不需要存储数据
    % data_table = array2table(eeg_record);   
    % filename=['D:\ATL\BCI_design\Finally_code\online_BCI\data2\7.5Hz_1_', num2str(i), '.csv'];
    % writetable(data_table,filename);
    %% 
    eeg_oz = eeg_record(:,3); % 仅使用Oz通道的数据 (列数据)
    eeg_record = [];
    EEG_DATA(:,i) = eeg_oz(1:900,1);  % 这里取Oz的1-900个数据点是因为，OpenBCI的采样率不稳定，选250Hz，可能实际只采集247个
    [vec,ts] = inlet.pull_sample();
    start = ts;
end

%% 将采集的RAW数据预处理,并返回频谱幅值最大值所对应的频率值，“当做”最后的识别结果
%暂时只取一个通道的数据，
%EEG_DATA,现在是 point*trail 的，然后把这个数据扔进去处理
result = sig_pro_all(EEG_DATA);  %每一列，是一个通道的数据
fprintf('程序识别后的刺激频率为：%.2f\n',result);

%% 处理完之后判断结果    
% 给每一个频率一个范围，在这个范围内的话，认为是某一频率的刺激产生的
send_hex = 0;                % 这里需要根据自己的实际情况进行调整
if (result>=6 && result <9)
    result = 8;send_hex = '10';
elseif(result>=9 && result <11)
    result = 10;send_hex = '40';
elseif(result>=11 && result <13)
    result = 12;send_hex = '30';
elseif(result>=13 && result <15)
    result = 14;send_hex = '20';
end

if (result==8 || result==10 ||result==12 || result==14)
    fprintf('最后识别的刺激频率为：%.2f\n',result);
else
    disp('识别失败！！！！！！！！');
end

%% 发送数据控制小车
% 向小车的HC-05模块发送16进制数来控制小车运动，该项目也给出了小车的STM32F103ZET6的程序
% 10前进，20右转，30左转，40后退
D = sscanf(send_hex, '%2x'); %将字符串转换成十六进制数据
fwrite(B, D, 'uint8')        %对定义的串口s发送该数据

