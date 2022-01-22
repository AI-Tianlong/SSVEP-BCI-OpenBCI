%% ����˵��
% ����������������ԣ�BCIduino/OpenBCI��matlabͨ��LSL����ʵʱ�����
% ����ɹ����գ����������д����д�ӡ�����յ�������

%% ����Ϊ����
%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); 
end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

[vec,ts] = inlet.pull_sample();
start = ts;
eeg_record = [];
while ts - start < 5   %5����5�룬�����ʾ�ɼ�5s�����ݣ����������� eeg_record ��
    [vec,ts] = inlet.pull_sample();
    eeg_record = [eeg_record;vec];
    fprintf('%.2f\t',vec);
    fprintf('%.2f\n', ts);
%     fprintf('\n');
end
