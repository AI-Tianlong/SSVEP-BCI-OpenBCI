%% 程序说明
% 该程序为脑电信号的预处理程序，并画出预处理过程中的所有图形（时域+频域）
% 脑电信号预处理流程如下：
% RAW数据-->去除基线漂移-->50Hz陷波滤波-->3-20Hz带通滤波-->对处理好的N次trail（N个人）数据取平均-->FFT
% 该Github项目也给出了部分的RAW数据
% 该程序所用数据为2021BCI竞赛中所采集的RAW数据，具体数据集可在清华大学脑机接口组下载，这里也给出对应的文献
% 
% @article{zhu_jiang_dong_gao_wang_2021, 
% title={An Open Dataset for Wearable SSVEP-Based Brain-Computer Interfaces}, 
%     volume={21}, 
%     ISSN={1424-8220}, 
%     DOI={10.3390/s21041256}, 
%     number={4}, 
%     journal={Sensors}, 
%     publisher={Sensors}, 
%     author={Zhu, Fangkun and Jiang, Lu and Dong, Guoya and Gao, Xiaorong and Wang, Yijun}, 
%     year={2021}, 
%     pages={1256}}

%% 以下为程序
close all
clear all
clc

%% 跑自己采的数据
% % % filename ='D:\ATL\BCI_design\Finally_code\online_BCI\data\12Hz_1_3.csv';
% % % Mat = csvread(filename);
% % % sig_raw = Mat(:,7);

%% 跑Tsinghua的raw数据
DATA = [];
for Nsubject = 10:20   %可以改成10:50的效果更好，平均50个被试的脑电数据，                                                           
    string=['./EEG_RAW_data/S0', num2str(Nsubject), '.mat']; 
    filename1 = string;      %更多数据集可以前往http://bci.med.tsinghua.edu.cn/download.html下载
    load (filename1)
    DATA1 = mean(squeeze(data(6,:,2,:,7)),2)';
    DATA(Nsubject,:) = DATA1;
end

sig_raw = mean(DATA,1);
%% 跑Tsinghua的bench数据
% % % DATA = [];
% % % for Nsubject = 1:2
% % % 
% % %     string=['./data1/S', num2str(Nsubject), '.mat'];
% % %     filename1 = string;
% % %     filename2 = './data1/Freq_Phase.mat';
% % %     load (filename1)
% % %     load (filename2)
% % % 
% % %     
% % %     DATA1 = mean(squeeze(data(62,:,1,:)),2)';
% % %     DATA(Nsubject,:) = DATA1;
% % % end
% % % 
% % % sig_raw = mean(DATA,1);
%% 去除基线漂移
NLen=length(sig_raw);
fs=250;%采样频率，可从软件上设定
Ts=1/fs;%时间间隔为采样频率的倒数
fmaxd=5;%截止频率为3Hz
fmaxn=fmaxd/(fs/2);
[b,a]=butter(1,fmaxn,'low');
data_3Hz = filtfilt(b,a,sig_raw);%通过3Hz低通滤波器的信号
sig_after_detrend = sig_raw - data_3Hz; %去除这一段信号，得到去基线漂移的信号

%绘图
figure,
subplot(3,1,1),plot(sig_raw),title('原始信号'),xlim([0 NLen]);
subplot(3,1,2),plot(data_3Hz),title('趋势线'),xlim([0 NLen]);
subplot(3,1,3),plot(sig_after_detrend),title('去除基线漂移的信号'),xlim([0 NLen]);

%% 50Hz 陷波滤波
%这里使用了Brainflow的信号处理库,请自己更换陷波滤波器或添加Brainflow库于matlab路径中
%详情使用方法可以参考 https://brainflow.readthedocs.io/en/stable/BuildBrainFlow.html#matlab

sig_after_notch = DataFilter.perform_bandstop(sig_after_detrend, 250, 50, 2, 3, 0, 0.2);  %50Hz工频的带阻

%% 4-90Hz带通滤波
[b, a] = butter_bandpass(4, 90, fs, 2);  %这里封装了一个函数，在文件夹下也给出了，参数为(f1,f2,采样率,阶数)
sig_after_Filt = filtfilt(b, a, sig_after_notch);

%% 画所有处理结果的时域图
% f0=50;
Fs=250;
Ts=1/Fs;
NLen=length(sig_after_detrend);
n=0:NLen-1;

figure,
subplot(4,2,1),plot(sig_raw);title('原始RAW脑电数据'),xlim([0 NLen]); 
subplot(4,2,2),plot(data_3Hz);title('基线漂移趋势线'),xlim([0 NLen]);
subplot(4,2,3),plot(sig_after_detrend);title('去除基线漂移后的信号'),ylabel('Amplitude(μV)'),xlim([0 NLen]);
subplot(4,2,5),plot(sig_after_notch);title('陷波滤波之后的信号'),ylabel('Amplitude(μV)'),xlim([0 NLen]);
subplot(4,2,7),plot(sig_after_Filt);title('带通滤波之后的信号'),ylabel('Amplitude(μV)'),xlim([0 NLen]);

%% 画所有处理结果的频谱图
% fft
N=2^nextpow2(length(sig_raw));  %去找2的倍数的点去做FFT
T=1/Fs;
f1=(0:(N-1))/(N*T);  

%去除基线漂移之后的频谱
amplitude = abs(fft(sig_after_detrend,N));  
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,4),plot(f1, data2,'linewidth', 1), xlim([5 80]), %ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('去除基线漂移之后的频谱图');

%去除基线漂移+陷波滤波之后的频谱
amplitude = abs(fft(sig_after_notch,N));    
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,6),plot(f1, data2,'linewidth', 1), xlim([5 80]),
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('去除基线漂移+陷波滤波之后的频谱图');

%去除基线漂移+陷波滤波+带通滤波之后的频谱
amplitude = abs(fft(sig_after_Filt,N));
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,8),plot(f1, data2,'linewidth', 1), xlim([5 80]), %ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('去除基线漂移+陷波滤波+带通滤波之后的频谱图');

