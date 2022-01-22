%% ����˵��
% �ó�����ͨ�����������ͨ�˲����ģ�f1,f2,�����ʣ��������ĸ�������
% �����˲�����[b,a]����ϵ��

%% ����Ϊ����
function [b,a] = butter_bandpass(lowcut, highcut, fs, order)
    nyq = 0.5*fs;
    low = lowcut / nyq;
    high = highcut /nyq;
    [b,a] = butter(order, [low, high]);
    
% Ȼ������������ y= filtfilt(b,a,data)