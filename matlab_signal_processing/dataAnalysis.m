% ----------------------------------
% Data analysis for the benchmark dataset
% Time domain: Bandpass filt -> Trial average -> subject average
% Frequency domain: Bandpass filt -> Trial average -> subject average -> Data tuncation 
%                                   -> FFT
% Sun, Qiang 10/03/2020
% hisunjiang@outlook.com
% Chongqing University EE BCI lab
% ----------------------------------
clear all
close all
clc

Fs = 250;
Wp = [7/Fs*2, 70/Fs*2];
Ws = [4/Fs*2, 75/Fs*2];
[N, Wn]=cheb1ord(Wp, Ws, 0.5, 40);
[b, a] = cheby1(N, 0.5, Wn);
[h, w] = freqz(b,a);
f=(0:length(w)-1)*Fs/2/length(w);
figure
plot(f,abs(h)), grid;
xlabel('Frequency (Hz)')
ylabel('Magnitude')

for Nsubject=1:35
    string=['./data/S', num2str(Nsubject), '.mat'];
    filename1 = string;
    filename2 = './data/Freq_Phase.mat';
    load (filename1)
    load (filename2)
    % Oz channel, stimulus is 15Hz
    % (1) Trial average
    data = mean(squeeze(data(62,:,8,:)), 2);

    N=2^nextpow2(length(data));  
    T=1/Fs;
    f1=(0:(N-1))/(N*T);  
    % (2) Bandpass filt
    data1 = filtfilt(b,a,data);
    % (3) fft
    amplitude = abs(fft(data,N));
    amplitude = amplitude*2/N;
    amplitude(1) = amplitude(1)/2;
    data2 = amplitude;
        
    AllSubjectDataFilted(:, Nsubject) = data1;
    AllSubjectDataRaw(:, Nsubject) =data2;
end
% (4) Subject average

%% Time domain Analysis (1)+(2)+(4) or (1)+(4)+(2)
AverDataFilted = mean(AllSubjectDataFilted, 2);
figure
subplot(311)
plot(AverDataFilted,'linewidth', 1), xlabel('Time(s)'), ylabel('Amplitude(��V)')
set(gca, 'Xtick', [0; 400; 1000; 1500])
set(gca,'XTickLabel',{'0','2','4','6'});
line([125 125], [-3 3], 'linewidth', 1, 'color', 'r','linestyle','--')
line([1375 1375], [-3 3], 'linewidth', 1, 'color', 'r','linestyle','--')

%% Frequency domain Analysis (1)+(3)+(4), CAUTION!!! (1)+(4)+(3) is wrong
%Ϊʲô1��4��3���У��������治���������
AverDataRaw = mean(AllSubjectDataRaw, 2);
subplot(312)
plot(f1, AverDataRaw,'linewidth', 1), xlim([5 80]), ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude(��V)')

%% SNR. 1Hz around central frequency, namely, 2048/250=8 points
%����Ƶ�ʸ���1Hz����2048/250=8��
%�����������£�
%1.���ǹ��ĵ������涨����˲���֮���Ƶ�ʣ�������7hz��������70hz
%����������Ҫ�ҵ�����Ƶ��λ�ú�����Ƶ��λ��
%����Ƶ��λ�õ�Ѱ�Ҳ�û��ʲôʵ�����壬��Ϊ����������Ĵ����о���FFT�����ݲ�û��ͨ����ͨ�˲������������޾���0
%��������ڽ����������������Raw���ݵ�ʱ��ͨ���˴�ͨ�˲�������ʱ���Ҫ�������������� 
%����Ƶ�ʵ�Ѱ�ң�����Ӧ����ϣ��Ѱ�ҵ�70Hz���Ѿ��㹻�ˣ���Ƶ��ͼ��������Ķ��г���Ѿ�û��͹�Եķ�ֵ��
%����Ƶ�ʣ�f1���ǰ���0~250hz�ģ�����fft�Ժ���2048�������㣬���Ծ��൱����AverDataRaw��250Hz��Ƶ�ʱ��ֳ���2048��
%����ÿ1hz��Ƶ�ʰ���2048/256=8���㣬��Ҳ���������Ǿ仰������
%��wang��ƪ����������ȷ�ᵽ�ˣ����о�������ȶ���Ϊ����Ƶ��f�µ����������2HzƵ�����ź�ƽ������ı�ֵ[f?1 f + 1]��
%���Ծ��������forѭ�������ж�

[~, index] = min(abs(f1-70));
amplitude = AverDataRaw;
SNR=zeros(1, index);
for Nf = 1:index
    if Nf==1%����ǵ�һ����Ļ���û��ǰ���Ƶ�ʣ����Ծ�����������8���㣬�൱�ڣ�����Ƶ��f�µ���������1HzƵ�����ź�ƽ������ı�ֵ[0 0+1]
        coef = amplitude(Nf)/mean(amplitude(Nf:Nf+8));
    elseif Nf>1 && Nf<=8%�������1~8����֮�䣬��ôSNR=����Ƶ��f�µ�������һ���㵽����f+8���� Ƶ�����ź�ƽ������ı�ֵ[0 f + 1]
        coef = amplitude(Nf)/mean(amplitude(1:Nf+8));
    elseif Nf>8 && Nf<index-8%�м䲿�־������Ƕ�����Ǹ���
        coef = amplitude(Nf)/mean(amplitude(Nf-8:Nf+8));
    elseif Nf>=index-8 && Nf < index%���С��index��8����
        coef = amplitude(Nf)/mean(amplitude(Nf-8:index));
    else
         coef = amplitude(Nf)/mean(amplitude(Nf-8:Nf)); 
    end
    SNR(Nf) = 20*log10(coef);
    %���Ե��ź�������ȣ����ǻ���ɵ�ѹ��ֵ�ı��ʹ�ϵ��20Lg(Vs/Vn)��Vs��Vn�ֱ�����źź�������ѹ�ġ���Чֵ����
    %���嶨�忴�������https://blog.csdn.net/weixin_41949409/article/details/120461773?spm=1001.2101.3001.6650.8&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8.pc_relevant_antiscanv2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8.pc_relevant_antiscanv2&utm_relevant_index=11
end
subplot(313)
plot(f1(1:index), SNR,'linewidth', 1), xlim([5 70])
xlabel('Frequency(Hz)'), ylabel('SNR(dB)')

%% Time & Frequency Analysis
figure
spectrogram(AverDataFilted,hamming(128),127,128,250, 'yaxis'), ylim([0 80]);

