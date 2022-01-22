%% ����˵��
% �ó���ΪSSVEP�����߷�������
% �ó�������������źŲɼ����ź�Ԥ����SSVEP�źŵ�ʶ��
% 
% �����������£�
% �ʼǱ�����������������С����HC-05ģ��-->����LSLʵʱ��ȡOpenBCI����������-->�Ե��źŴ���(sig_pro_all����)-->
% -->�ж��շ�SSVEP�Ĵ̼�Ƶ�ʲ�����С���˶�
% 
%% ����Ϊ����
close all
clc
%% ��������С����HC-05����ģ��
% ע��ô����ֻ��ִ��һ�Σ�ִ��һ�κ����ε�������ڶ���ִ�г���ᱨ��
clear all                   % ֻ��ִ��һ�Σ�������,ִ��֮�����ε��ô���飡
B=Bluetooth('ssvep',1);     % ����ȥѡ�����Լ���HC-05ģ��
fopen(B);
disp('С�����������ӳɹ�');
% 10ǰ����20��ת��30��ת��40����

%% LSL ���ܴ�OpenBCI������������
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
disp('�ɹ����յ�����...');
fprintf('%.2f\t\t',vec);
fprintf('\n');
start = ts;
eeg_record = [];
EEG_DATA = [];

for i=1:4    %�޸�trail����
    while ts - start < 4    %�޸�ÿһ��trail�ɼ��źŵ�ʱ��
        [vec,ts] = inlet.pull_sample();
        eeg_record = [eeg_record; vec];  %һ������һ��ͨ��
        %fprintf('%.2f\t\t',vec);
        %fprintf('\n');       
    end
   %% �����߷����ɼ������ݴ�Ϊcsv�ļ����Թ����߷�������ʵ�����߷�����ʱ����Ҫ�洢����
    % data_table = array2table(eeg_record);   
    % filename=['D:\ATL\BCI_design\Finally_code\online_BCI\data2\7.5Hz_1_', num2str(i), '.csv'];
    % writetable(data_table,filename);
    %% 
    eeg_oz = eeg_record(:,3); % ��ʹ��Ozͨ�������� (������)
    eeg_record = [];
    EEG_DATA(:,i) = eeg_oz(1:900,1);  % ����ȡOz��1-900�����ݵ�����Ϊ��OpenBCI�Ĳ����ʲ��ȶ���ѡ250Hz������ʵ��ֻ�ɼ�247��
    [vec,ts] = inlet.pull_sample();
    start = ts;
end

%% ���ɼ���RAW����Ԥ����,������Ƶ�׷�ֵ���ֵ����Ӧ��Ƶ��ֵ��������������ʶ����
%��ʱֻȡһ��ͨ�������ݣ�
%EEG_DATA,������ point*trail �ģ�Ȼ�����������ӽ�ȥ����
result = sig_pro_all(EEG_DATA);  %ÿһ�У���һ��ͨ��������
fprintf('����ʶ���Ĵ̼�Ƶ��Ϊ��%.2f\n',result);

%% ������֮���жϽ��    
% ��ÿһ��Ƶ��һ����Χ���������Χ�ڵĻ�����Ϊ��ĳһƵ�ʵĴ̼�������
send_hex = 0;                % ������Ҫ�����Լ���ʵ��������е���
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
    fprintf('���ʶ��Ĵ̼�Ƶ��Ϊ��%.2f\n',result);
else
    disp('ʶ��ʧ�ܣ���������������');
end

%% �������ݿ���С��
% ��С����HC-05ģ�鷢��16������������С���˶�������ĿҲ������С����STM32F103ZET6�ĳ���
% 10ǰ����20��ת��30��ת��40����
D = sscanf(send_hex, '%2x'); %���ַ���ת����ʮ����������
fwrite(B, D, 'uint8')        %�Զ���Ĵ���s���͸�����

