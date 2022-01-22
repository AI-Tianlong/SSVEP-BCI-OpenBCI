%% ����˵�� sig_pro_all,�� signal_processing_all
% �ú����������������RAW�Ե��źŽ���Ԥ����ͨ��Ƶ�׷�ֵ�жϲ�����ǰ�Ե��źŵĴ̼�Ƶ��
% ���ս�Ƶ���жϵĽ�����ظ���������
% �������Ƶ�׵���߷�ֵ�ж������⣬�Ϻõķ���Ӧ�����������ף�
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

%% ����˵��
% DATA��raw EEG����,���������е�˼�룬�Ǵ����ĳһͨ����N������/N���˵ģ�ͬһ��˸�̼��µ��Ե�raw����
% DATA��һ��point*trail��״�����ݾ���
% point��������*����ʱ�䣬���Ե����ݵĵ���
% trail��N�����飨N���ˣ����Ե�����
% �ɼ���DATA�ǰ������е�һ�����ݾ���ÿһ�е������д���һ��ͨ����һ��ʵ����������ݵ�
% �ڱ������е��źŴ����������£�
% RAW����-->ȥ������Ư��-->50Hz�ݲ��˲�-->3-20Hz��ͨ�˲�-->�Դ���õ�N��trail����ȡƽ��-->FFT������Ƶ�׷�ֵ���ֵ��Ӧ��Ƶ��ֵ

%% ����
function [result] = sig_pro_all(DATA)
    %��������
    [point,trail] = size(DATA); 

    result_sig = [];
    for i=1:trail
        sig_raw = DATA(:,i);
        
       %% ȥ������Ư��  ������Ҫ��������
        NLen=length(sig_raw);
        fs=250;           %����Ƶ�ʣ��ɴ�������趨
        Ts=1/fs;          %ʱ����Ϊ����Ƶ�ʵĵ���
        fmaxd=5;          %��ֹƵ��Ϊ5Hz
        fmaxn=fmaxd/(fs/2);
        [b,a]=butter(1,fmaxn,'low');
        data_3Hz = filtfilt(b,a,sig_raw);       %ͨ��5Hz��ͨ�˲������ź�
        sig_after_detrend = sig_raw - data_3Hz; %ȥ����һ���źţ��õ�ȥ����Ư�Ƶ��ź�

       %% 50Hz �ݲ��˲�
        % ע�⣬����brainflow������ƣ�������Ҫ��������Ϊ�����ݣ���ÿһͨ�����Ե�����Ҫ��һ�������룬���������и�ת��
        sig_after_notch = DataFilter.perform_bandstop(sig_after_detrend', 250, 50, 2, 5, 0, 0.2);  %50Hz��Ƶ�Ĵ���
        sig_after_notch = sig_after_notch';

        

        %% 3-20��ͨ�˲�
        Fs=250; %������
        [b, a] = butter_bandpass(3,20,Fs, 2);
        sig_after_Filt = filtfilt(b, a, sig_after_notch);

        %% Ԥ�����������
        result_sig = [result_sig, sig_after_Filt]; %��Ԥ����������ݴ����µ�һ��������--->result_sig
    end
    %% ��Ԥ��������Ե�������ƽ��
    result_sig_mean = mean(result_sig,2);  
    
    %% fft
    N=2^nextpow2(length(sig_raw));
    T=1/Fs;
    f1=(0:(N-1))/(N*T);   
    amplitude = abs(fft(result_sig_mean,N));
    amplitude = amplitude*2/N;
    amplitude(1) = amplitude(1)/2;
    data2 = amplitude;

    %% ����Ƶ���з�ֵ��ߵ�����Ӧ��Ƶ��ֵ
    [~,result] = max(data2);
    result = f1(result);

