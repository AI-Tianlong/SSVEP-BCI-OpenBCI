# matlab_signal_processing
## 该文件夹下包含6个程序文件，1个data文件夹，2个必备的库(LSL和Brainflow)
* **1 `bluetooth_test.m`---蓝牙测试程序**
* **2 `train_receive_data.m`---OpenBCI通过LSL传输至matlab的程序**
* **3 `butter_bandpass.m`函数---给定带通滤波器参数，返回[b,a]**
* **4 `sig_pro_all.m`函数---`online_analysis.m`会调用其进行信号处理**
* **5 `offline_analysis.m`---离线分析程序**  
* **6 `online_analysis.m`---在线分析程序**  
* **7 `EEG_RAW_data`---文件夹：存放RAW脑电数据**  
* **8 `liblsl-Matlab-master`---库文件夹**，解压后添加到matlab路径
* **9 `Brainflow`---库文件夹**  自己下载吧hhh，然后添加到matlab路径
> 注：每一个程序中均给出了详细的代码注释以及对应的参考文献。: )


## 1 `bluetooth_test.m`
该程序用来测试笔记本电脑和HC-05蓝牙模块的连接  
> 需要注意的是，其中的`B=Bluetooth('ssvep',1);`语句，在运行成功后会在workspace产生一个变量B，如不清除，第二次运行会报错！


## 2 `train_receive_data.m`
该程序是用来测试**OpenBCI/航弈的BCIduino**通过**LSL**将脑电数据实时传输至Matlab的  
> 在使用前需要将文件夹`liblsl-Matlab-master`中的内容全部添加至matlab路径  
> 这里有个不可忽视的问题，那就是由于windows电脑在通过COM端口接收数据的时候会有缓冲，所以导致在matlab中接收到的数据不那么实时  
> 这里有个解决的办法就是需要对windows电脑的FTDI缓冲进行修复，来保证接收到的脑电数据尽可能的实时

 
[Windows 上的 FTDI 缓冲区修复](https://github.com/a839290771/SSVEP-BCI-OpenBCI/new/ATL_version)  
👆以上的这一步是一定一定要做的，教程可能有些老，可自己搜索一下win10/win11的解决办法，几乎差不多

## 3 `butter_bandpass.m`
该函数通过四个输入参数来计算带通滤波器的系数[b,a]  
> 该函数在 **`offline_analysis`和`online_analysis`** 中均有调用  
> 四个参数分别为(f1,f2,采样率Fs,滤波器阶数)  


## 4 `sig_pro_all.m`
该函数是用来将传入的RAW脑电信号进行预处理并通过频谱幅值判断诱发出当前脑电信号的闪烁刺激的频率
> 在使用前需要将文件夹`Brainflow`文件夹中的内容全部添加至matlab路径
```MATLAB
% 函数说明 sig_pro_all,即 signal_processing_all
% 该函数是用来将传入的RAW脑电信号进行预处理并通过频谱幅值判断产生当前脑电信号的刺激频率
% 最终将频率判断的结果返回给主程序中
% 这里仅用频谱的最高幅值判断有问题，较好的方法应参照以下文献：
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
```

## 5 `offline_analysis.m`
> 在使用前需要将文件夹`Brainflow`文件夹中的内容全部添加至matlab路径
```MATLAB 
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
```
## 6 `online_analysis.m`
> 在使用前需要将文件夹`liblsl-Matlab-master`，`Brainflow`文件夹中的内容全部添加至matlab路径
```MATLAB
%% 程序说明
% 该程序为SSVEP的在线分析程序
% 该程序包含完整的信号采集、信号预处理、SSVEP信号的识别
% 
% 程序流程如下：
% 笔记本电脑蓝牙连接蓝牙小车的HC-05模块-->依靠LSL实时获取OpenBCI传来的数据-->脑电信号处理(sig_pro_all函数)-->
% -->判断诱发SSVEP的刺激频率并控制小车运动
% 
```
## 7 EEG_RAW_data 文件夹
存放的为RAW脑电数据,这里给出了S010-S050个mat文件，具体数据集情况见文件夹下`readme.pdf`文件以及以下文献
```
@article{zhu_jiang_dong_gao_wang_2021, 
 title={An Open Dataset for Wearable SSVEP-Based Brain-Computer Interfaces}, 
     volume={21}, 
     ISSN={1424-8220}, 
     DOI={10.3390/s21041256}, 
     number={4}, 
     journal={Sensors}, 
     publisher={Sensors}, 
     author={Zhu, Fangkun and Jiang, Lu and Dong, Guoya and Gao, Xiaorong and Wang, Yijun}, 
     year={2021}, 
     pages={1256}}
```
## 8 `liblsl-Matlab-master`---库文件夹 
> LSL的库，需要将该文件及其文件夹完整的添加到Matlab路径，具体可见[LSL的Github](https://github.com/sccn/labstreaminglayer)

![image](https://user-images.githubusercontent.com/50650583/150638131-a7678c43-3b60-407d-8e98-7ccff088fc50.png)
<img src='https://user-images.githubusercontent.com/50650583/150638053-040a6092-8e49-4874-a09b-a383d0c7ff28.png' width='80%'/>

## 9 `Brainflow`---库文件夹  
> Brainflow的库，需要将该文件及其文件夹完整的添加到Matlab路径,里面有大量的用于信号处理的封装好的函数，具体可见Brainflow官网
[Brainflow官方参考资料](https://brainflow.readthedocs.io/en/stable/index.html)  
> 文件太大了，上传不上来https://brainflow.readthedocs.io/en/stable/BuildBrainFlow.html#matlab，可以自己在官方下hhhh
