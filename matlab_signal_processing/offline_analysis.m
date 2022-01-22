%% ����˵��
% �ó���Ϊ�Ե��źŵ�Ԥ������򣬲�����Ԥ��������е�����ͼ�Σ�ʱ��+Ƶ��
% �Ե��ź�Ԥ�����������£�
% RAW����-->ȥ������Ư��-->50Hz�ݲ��˲�-->3-20Hz��ͨ�˲�-->�Դ���õ�N��trail��N���ˣ�����ȡƽ��-->FFT
% ��Github��ĿҲ�����˲��ֵ�RAW����
% �ó�����������Ϊ2021BCI���������ɼ���RAW���ݣ��������ݼ������廪��ѧ�Ի��ӿ������أ�����Ҳ������Ӧ������
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

%% ����Ϊ����
close all
clear all
clc

%% ���Լ��ɵ�����
% % % filename ='D:\ATL\BCI_design\Finally_code\online_BCI\data\12Hz_1_3.csv';
% % % Mat = csvread(filename);
% % % sig_raw = Mat(:,7);

%% ��Tsinghua��raw����
DATA = [];
for Nsubject = 10:20   %���Ըĳ�10:50��Ч�����ã�ƽ��50�����Ե��Ե����ݣ�                                                           
    string=['./EEG_RAW_data/S0', num2str(Nsubject), '.mat']; 
    filename1 = string;      %�������ݼ�����ǰ��http://bci.med.tsinghua.edu.cn/download.html����
    load (filename1)
    DATA1 = mean(squeeze(data(6,:,2,:,7)),2)';
    DATA(Nsubject,:) = DATA1;
end

sig_raw = mean(DATA,1);
%% ��Tsinghua��bench����
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
%% ȥ������Ư��
NLen=length(sig_raw);
fs=250;%����Ƶ�ʣ��ɴ�������趨
Ts=1/fs;%ʱ����Ϊ����Ƶ�ʵĵ���
fmaxd=5;%��ֹƵ��Ϊ3Hz
fmaxn=fmaxd/(fs/2);
[b,a]=butter(1,fmaxn,'low');
data_3Hz = filtfilt(b,a,sig_raw);%ͨ��3Hz��ͨ�˲������ź�
sig_after_detrend = sig_raw - data_3Hz; %ȥ����һ���źţ��õ�ȥ����Ư�Ƶ��ź�

%��ͼ
figure,
subplot(3,1,1),plot(sig_raw),title('ԭʼ�ź�'),xlim([0 NLen]);
subplot(3,1,2),plot(data_3Hz),title('������'),xlim([0 NLen]);
subplot(3,1,3),plot(sig_after_detrend),title('ȥ������Ư�Ƶ��ź�'),xlim([0 NLen]);

%% 50Hz �ݲ��˲�
%����ʹ����Brainflow���źŴ����,���Լ������ݲ��˲��������Brainflow����matlab·����
%����ʹ�÷������Բο� https://brainflow.readthedocs.io/en/stable/BuildBrainFlow.html#matlab

sig_after_notch = DataFilter.perform_bandstop(sig_after_detrend, 250, 50, 2, 3, 0, 0.2);  %50Hz��Ƶ�Ĵ���

%% 4-90Hz��ͨ�˲�
[b, a] = butter_bandpass(4, 90, fs, 2);  %�����װ��һ�����������ļ�����Ҳ�����ˣ�����Ϊ(f1,f2,������,����)
sig_after_Filt = filtfilt(b, a, sig_after_notch);

%% �����д�������ʱ��ͼ
% f0=50;
Fs=250;
Ts=1/Fs;
NLen=length(sig_after_detrend);
n=0:NLen-1;

figure,
subplot(4,2,1),plot(sig_raw);title('ԭʼRAW�Ե�����'),xlim([0 NLen]); 
subplot(4,2,2),plot(data_3Hz);title('����Ư��������'),xlim([0 NLen]);
subplot(4,2,3),plot(sig_after_detrend);title('ȥ������Ư�ƺ���ź�'),ylabel('Amplitude(��V)'),xlim([0 NLen]);
subplot(4,2,5),plot(sig_after_notch);title('�ݲ��˲�֮����ź�'),ylabel('Amplitude(��V)'),xlim([0 NLen]);
subplot(4,2,7),plot(sig_after_Filt);title('��ͨ�˲�֮����ź�'),ylabel('Amplitude(��V)'),xlim([0 NLen]);

%% �����д�������Ƶ��ͼ
% fft
N=2^nextpow2(length(sig_raw));  %ȥ��2�ı����ĵ�ȥ��FFT
T=1/Fs;
f1=(0:(N-1))/(N*T);  

%ȥ������Ư��֮���Ƶ��
amplitude = abs(fft(sig_after_detrend,N));  
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,4),plot(f1, data2,'linewidth', 1), xlim([5 80]), %ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('ȥ������Ư��֮���Ƶ��ͼ');

%ȥ������Ư��+�ݲ��˲�֮���Ƶ��
amplitude = abs(fft(sig_after_notch,N));    
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,6),plot(f1, data2,'linewidth', 1), xlim([5 80]),
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('ȥ������Ư��+�ݲ��˲�֮���Ƶ��ͼ');

%ȥ������Ư��+�ݲ��˲�+��ͨ�˲�֮���Ƶ��
amplitude = abs(fft(sig_after_Filt,N));
amplitude = amplitude*2/N;
amplitude(1) = amplitude(1)/2;
data2 = amplitude;
subplot(4,2,8),plot(f1, data2,'linewidth', 1), xlim([5 80]), %ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude'),title('ȥ������Ư��+�ݲ��˲�+��ͨ�˲�֮���Ƶ��ͼ');

