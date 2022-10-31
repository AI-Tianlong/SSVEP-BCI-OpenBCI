# SSVEP-BCI-OpenBCI
## ***此项目由中北大学信息与通信工程学院信号分析与系统仿真实验室创建***  
## ***(The project was created by North University of China)***
>此项目是基于OpenBCI(Bciduino)完成的SSVEP项目，包括以下部分的所有程序
* 基于Matlab Psychtoolbox3的闪烁刺激器
* 基于BCIduino放大器和LSL的信号实时传输 
* 基于Matlab的脑电信号预处理
* 基于FFT的SSVEP分类
* 利用分类结果通过笔记本自带蓝牙去控制蓝牙小车运动
## 硬件系统搭建
需要自己购买杭州航弈生物科技有限公司的BCIduino或者OpenBCI，信号的采集基于OpenBCI上位机LSL完成  
<img src="https://user-images.githubusercontent.com/50650583/149366828-08c202de-0f79-499a-be11-0f1ad2f552e0.png" width="50%"/>




## 基于Matlab Psychtoolbox3的闪烁刺激器
### ---`matlab_stimulator`文件夹
<img src="https://user-images.githubusercontent.com/50650583/149368480-8caf2b23-deaa-4d2d-9e05-e512cc4999f4.png" width="50%">



## 基于BCIduino放大器和LSL的信号实时传输
### ---`matlab_signal_processing`文件夹-->查看具体说明
![image](https://user-images.githubusercontent.com/50650583/149366997-4a9ed976-9df0-4e66-967d-bdf5d09014a8.png)

## 基于Matlab的脑电信号预处理
### ---`matlab_signal_processing`文件夹-->`offline_analysis`
<img src="https://user-images.githubusercontent.com/50650583/149368378-8ab0b548-8648-42c0-b7c5-b6587f54fd0f.png" width="100%">






## 基于FFT的SSVEP分类
### ---`matlab_signal_processing`文件夹-->`online_analysis`

## 利用分类结果去控制蓝牙小车运动
### ---`matlab_signal_processing`文件夹-->`online_analysis`
<img src='https://user-images.githubusercontent.com/50650583/150639266-47c4ba26-1e60-42e0-bb8a-ba16dde6c2df.png' width='70%'/>.


