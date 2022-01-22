%% 函数说明
% 该程序是通过用来输出带通滤波器的（f1,f2,采样率，阶数）四个参数后
% 返回滤波器的[b,a]两个系数

%% 以下为程序
function [b,a] = butter_bandpass(lowcut, highcut, fs, order)
    nyq = 0.5*fs;
    low = lowcut / nyq;
    high = highcut /nyq;
    [b,a] = butter(order, [low, high]);
    
% 然后在主程序中 y= filtfilt(b,a,data)