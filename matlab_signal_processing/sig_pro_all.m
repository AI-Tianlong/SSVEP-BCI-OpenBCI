%% 函数说明 sig_pro_all,即 signal_processing_all
% 该函数是用来将传入的RAW脑电信号进行预处理并通过频谱幅值判断产生当前脑电信号的刺激频率
% 最终将频率判断的结果返回给主程序中
% 这里仅用频谱的最高幅值判断有问题，较好的方法应参照以下文献：
%
% @ARTICLE{1035968,
%   author={Ming Cheng and Xiaorong Gao and Shangkai Gao and Dingfeng Xu},
%   journal={IEEE Transactions on Biomedical Engineering}, 
%   title={Design and implementation of a brain-computer interface with high transfer rates}, 
%   year={2002},
%   volume={49},
%   number={10},
%   pages={1181-1186},
%   doi={10.1109/TBME.2002.803536}}

%% 参数说明
% DATA是raw EEG数据,根据文献中的思想，是存放有某一通道的N次试验/N个人的，同一闪烁刺激下的脑电raw数据
% DATA是一个point*trail形状的数据矩阵
% point：采样率*采样时间，即脑电数据的点数
% trail：N次试验（N个人）的脑电数据
% 可见，DATA是按列排列的一个数据矩阵，每一列的所有行代表一个通道的一次实验的所有数据点
% 在本程序中的信号处理流程如下：
% RAW数据-->去除基线漂移-->50Hz陷波滤波-->3-20Hz带通滤波-->对处理好的N次trail数据取平均-->FFT并返回频谱幅值最大值对应的频率值

%% 程序
function [result] = sig_pro_all(DATA)
    %传入数据
    [point,trail] = size(DATA); 

    result_sig = [];
    for i=1:trail
        sig_raw = DATA(:,i);
        
       %% 去除基线漂移  这里需要给列数据
        NLen=length(sig_raw);
        fs=250;           %采样频率，可从软件上设定
        Ts=1/fs;          %时间间隔为采样频率的倒数
        fmaxd=5;          %截止频率为5Hz
        fmaxn=fmaxd/(fs/2);
        [b,a]=butter(1,fmaxn,'low');
        data_3Hz = filtfilt(b,a,sig_raw);       %通过5Hz低通滤波器的信号
        sig_after_detrend = sig_raw - data_3Hz; %去除这一段信号，得到去基线漂移的信号

       %% 50Hz 陷波滤波
        % 注意，由于brainflow库的限制，这里需要给的数据为行数据，即每一通道的脑电数据要用一行来输入，所以这里有个转置
        sig_after_notch = DataFilter.perform_bandstop(sig_after_detrend', 250, 50, 2, 5, 0, 0.2);  %50Hz工频的带阻
        sig_after_notch = sig_after_notch';

        

        %% 3-20带通滤波
        Fs=250; %采样率
        [b, a] = butter_bandpass(3,20,Fs, 2);
        sig_after_Filt = filtfilt(b, a, sig_after_notch);

        %% 预处理完的数据
        result_sig = [result_sig, sig_after_Filt]; %将预处理完的数据存入新的一个矩阵中--->result_sig
    end
    %% 对预处理完的脑电数据做平均
    result_sig_mean = mean(result_sig,2);  
    
    %% fft
    N=2^nextpow2(length(sig_raw));
    T=1/Fs;
    f1=(0:(N-1))/(N*T);   
    amplitude = abs(fft(result_sig_mean,N));
    amplitude = amplitude*2/N;
    amplitude(1) = amplitude(1)/2;
    data2 = amplitude;

    %% 返回频谱中幅值最高的所对应的频率值
    [~,result] = max(data2);
    result = f1(result);

