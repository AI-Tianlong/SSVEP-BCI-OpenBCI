# SSVEP-BCI-OpenBCI ![贡献者](https://img.shields.io/github/contributors/AI-Tianlong/SSVEP-BCI-OpenBCI?label=%E5%90%88%E4%BD%9C%E8%B4%A1%E7%8C%AE%E8%80%85)[![LB](https://img.shields.io/github/followers/LBMoon?label=LiuBo&style=social)](https://github.com/LBMoon)  [![FZ](https://img.shields.io/github/followers/zhuangfeng122915?label=FengZhuang&style=social)](https://github.com/zhuangfeng122915) [![LWL](https://img.shields.io/github/followers/lwlBCI?label=LWL&style=social)](https://github.com/lwlBCI) [![BXL](https://img.shields.io/github/followers/Bu0717?label=BXL&style=social)](https://github.com/Bu0717)  [![ZZH](https://img.shields.io/github/followers/HITzihao?label=ZZH&style=social)](https://github.com/HITzihao) [![ATL](https://img.shields.io/github/followers/AI-Tianlong?label=ATL&style=social)](https://github.com/AI-Tianlong) 

### **此项目由中北大学信息与通信工程学院信号分析与系统仿真实验室创建**  
## [点这里查看《SSVEP-BCI-OpenBCI项目复现指南》](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/%E3%80%8ASSVEP-OpenBCI%E9%A1%B9%E7%9B%AE%E5%A4%8D%E7%8E%B0%E6%8C%87%E5%8D%97%E3%80%8B.md)⬅复现此项目必看文档！！！

## 此项目是基于OpenBCI(Bciduino)完成的SSVEP项目，包括以下部分程序（均为Matlab代码）
* 基于Matlab Psychtoolbox3的闪烁刺激器
* 基于BCIduino放大器和LSL的信号实时传输
* 基于Matlab的脑电信号预处理
* 基于频谱分析的SSVEP分类
* 利用分类结果通过笔记本自带蓝牙去控制蓝牙小车运动
* 利用分类结果实现脑控打字
## 硬件系统搭建
需要自己购买杭州航弈生物科技有限公司的BCIduino或者OpenBCI，信号的采集基于OpenBCI上位机LSL完成  
<img src="https://user-images.githubusercontent.com/50650583/149366828-08c202de-0f79-499a-be11-0f1ad2f552e0.png" width="50%"/>




### 基于Matlab Psychtoolbox3的闪烁刺激器
### ---[`matlab_stimulator`文件夹](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_stimulator)--->[`BCI_car_stimu.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_stimulator/BCI_car_stimu.m)
<img src="https://user-images.githubusercontent.com/50650583/149368480-8caf2b23-deaa-4d2d-9e05-e512cc4999f4.png" width="50%">



## 基于BCIduino放大器和LSL的信号实时传输
### ---[`matlab_signal_processing`文件夹](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_signal_processing)-->查看具体说明
![image](https://user-images.githubusercontent.com/50650583/149366997-4a9ed976-9df0-4e66-967d-bdf5d09014a8.png)

## 基于Matlab的脑电信号预处理
### ---[`matlab_signal_processing`文件夹](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_signal_processing)-->[`offline_analysis.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_signal_processing/offline_analysis.m)
<img src="https://user-images.githubusercontent.com/50650583/149368378-8ab0b548-8648-42c0-b7c5-b6587f54fd0f.png" width="100%">






## 基于FFT的SSVEP分类
### ---[`matlab_signal_processing`文件夹](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_signal_processing)-->[`online_analysis.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_signal_processing/online_analysis.m)

## 利用分类结果去控制蓝牙小车运动
### ---[`matlab_signal_processing`文件夹](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_signal_processing)-->[`online_analysis.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_signal_processing/online_analysis.m)
<img src='https://user-images.githubusercontent.com/50650583/150639266-47c4ba26-1e60-42e0-bb8a-ba16dde6c2df.png' width='70%'/>

此外，关于本项目的其它问题欢迎随时联系贡献者中的 [![LWL](https://img.shields.io/github/followers/lwlBCI?label=LWL&style=social)](https://github.com/lwlBCI)😚

敬请期待后续更新
## 更新小记
### 2023-11-10 我们的 Repo 获得了 40 的star⭐
### 2023-11-29 我们的 Repo 获得了 43 的star⭐ 
### 2023-12-19 我们的 Repo 获得了 45 的star⭐ 
(感谢各位对本工作的兴趣与肯定)
