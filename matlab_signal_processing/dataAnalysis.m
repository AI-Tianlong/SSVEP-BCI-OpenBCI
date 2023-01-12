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
plot(AverDataFilted,'linewidth', 1), xlabel('Time(s)'), ylabel('Amplitude(μV)')
set(gca, 'Xtick', [0; 400; 1000; 1500])
set(gca,'XTickLabel',{'0','2','4','6'});
line([125 125], [-3 3], 'linewidth', 1, 'color', 'r','linestyle','--')
line([1375 1375], [-3 3], 'linewidth', 1, 'color', 'r','linestyle','--')

%% Frequency domain Analysis (1)+(3)+(4), CAUTION!!! (1)+(4)+(3) is wrong
%为什么1，4，3不行，我现在真不清楚呜呜呜
AverDataRaw = mean(AllSubjectDataRaw, 2);
subplot(312)
plot(f1, AverDataRaw,'linewidth', 1), xlim([5 80]), ylim([0 3])
xlabel('Frequency(Hz)'), ylabel('Amplitude(μV)')

%% SNR. 1Hz around central frequency, namely, 2048/250=8 points
%中心频率附近1Hz，即2048/250=8点
%所以流程如下：
%1.我们关心的是上面定义的滤波器之间的频率，下限是7hz，上限是70hz
%所以我们需要找到下限频率位置和上限频率位置
%下限频率位置的寻找并没有什么实际意义，因为我们在上面的代码中经过FFT的数据并没有通过带通滤波器，所以下限就是0
%如果我们在将来处理采来的那种Raw数据的时候通过了带通滤波器，那时候就要考虑下限问题了 
%上限频率的寻找：这里应该是希望寻找到70Hz就已经足够了，从频谱图来看后面的多次谐波已经没有凸显的峰值了
%上限频率：f1中是包含0~250hz的，并且fft以后是2048个采样点，所以就相当于在AverDataRaw中250Hz的频率被分成了2048份
%所以每1hz的频率包含2048/256=8个点，这也就是上面那句话的意义
%在wang那篇论文里面明确提到了：本研究将信噪比定义为给定频率f下的振幅与相邻2Hz频带内信号平均振幅的比值[f?1 f + 1]。
%所以就是下面的for循环里面判断

[~, index] = min(abs(f1-70));
amplitude = AverDataRaw;
SNR=zeros(1, index);
for Nf = 1:index
    if Nf==1%如果是第一个点的话，没有前面的频率，所以就是往后延伸8个点，相当于：给定频率f下的振幅与后面1Hz频带内信号平均振幅的比值[0 0+1]
        coef = amplitude(Nf)/mean(amplitude(Nf:Nf+8));
    elseif Nf>1 && Nf<=8%如果是在1~8个点之间，那么SNR=给定频率f下的振幅与第一个点到后面f+8个点 频带内信号平均振幅的比值[0 f + 1]
        coef = amplitude(Nf)/mean(amplitude(1:Nf+8));
    elseif Nf>8 && Nf<index-8%中间部分就是我们定义的那个了
        coef = amplitude(Nf)/mean(amplitude(Nf-8:Nf+8));
    elseif Nf>=index-8 && Nf < index%最后小于index的8个点
        coef = amplitude(Nf)/mean(amplitude(Nf-8:index));
    else
         coef = amplitude(Nf)/mean(amplitude(Nf-8:Nf)); 
    end
    SNR(Nf) = 20*log10(coef);
    %对脑电信号求信噪比：我们换算成电压幅值的比率关系：20Lg(Vs/Vn)，Vs和Vn分别代表信号和噪声电压的“有效值”。
    %具体定义看这个博客https://blog.csdn.net/weixin_41949409/article/details/120461773?spm=1001.2101.3001.6650.8&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8.pc_relevant_antiscanv2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8.pc_relevant_antiscanv2&utm_relevant_index=11
end
subplot(313)
plot(f1(1:index), SNR,'linewidth', 1), xlim([5 70])
xlabel('Frequency(Hz)'), ylabel('SNR(dB)')

%% Time & Frequency Analysis
figure
spectrogram(AverDataFilted,hamming(128),127,128,250, 'yaxis'), ylim([0 80]);

