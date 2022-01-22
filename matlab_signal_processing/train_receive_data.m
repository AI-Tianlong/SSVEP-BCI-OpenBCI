%% 程序说明
% 这个程序是用来测试，BCIduino/OpenBCI和matlab通过LSL进行实时传输的
% 如果成功接收，会在命令行窗口中打印出接收到的数据

%% 以下为程序
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
while ts - start < 5   %5代表5秒，这里表示采集5s的数据，并存在数组 eeg_record 中
    [vec,ts] = inlet.pull_sample();
    eeg_record = [eeg_record;vec];
    fprintf('%.2f\t',vec);
    fprintf('%.2f\n', ts);
%     fprintf('\n');
end
