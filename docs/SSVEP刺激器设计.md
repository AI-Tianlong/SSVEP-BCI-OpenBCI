# SSVEP刺激器设计🐇

## 🤡SSVEP介绍

* 稳态视觉诱发电位(<font color='red'>S</font>teady-<font color='red'>S</font>tate <font color='red'>V</font>isual <font color='red'>E</font>voked <font color='red'>P</font>otential,<font color='red'>SSVEP</font>)

* 当人体受到一个固定频率的闪烁或者变换模式的视觉刺激时，大脑皮层的电位活动将被调制，从而产生一个连续的且与刺激频率有关（刺激频率的基频或倍频处）的响应，这个响应具有和视觉刺激类似的周期性节律，即为稳态视觉诱发电位(`SSVEP`)。`SSVEP`信号表现在`EEG`脑电信号中则是在功率谱中能在刺激频率或谐波上出现谱峰。通过分析检测谱峰处对应的频率，即能检测到受试者视觉注视的刺激源，从而能识别受试者的意图。

🙌[稳态视觉诱发电位 SSVEP 简介](https://mp.weixin.qq.com/s?__biz=Mzg4MzYzNDgwMQ==&mid=2247508127&idx=1&sn=77ada479f6df75d0f5eec8cb1122d1bd&source=41#wechat_redirect)

🙌[A Quick Intro to SSVEP: Steady State Visually Evoked Potential – Synaptitude (archive.org)](https://web.archive.org/web/20181209171157/http://synaptitude.me/blog/a-quick-intro-to-ssvep-steady-state-visually-evoked-potential/)

## 🐻SSVEP设计

由于稳态视觉诱发电位范式的脑机接口需要设计对应的闪烁刺激器来在大脑皮层枕叶区诱发出对应的脑电信号。我们采用==正弦频率相位联合调制==的方法，相比以往单一的黑白两色闪烁，采用正弦调制的方法，可以增加闪烁刺激的目标数，并且可以在屏幕刷新率允许的范围内，实现任意频率的闪烁刺激。这样既避免了使用者注视某一特定闪烁块时相邻闪烁块对其造成的干扰，又能实现任意频率的闪烁刺激，这大大提高了设备的适用性，对于不同的使用者，只需在佩戴后进行一定的校准训练即可。

刺激频率的相关注意事项

* <font color='red'>不要用整数</font>
* <font color='red'>50Hz也要避免，包括50Hz的二分之一什么的</font>
* <font color='red'>2个目标的话，频率的间隔可以大一些，一个5.6Hz，一个7.4这种</font>
* 如果目标多的话，频率的间隔也不要太小，毕竟是人，分不出来!
* 刺激频率分为低、中、高频段
* 现在用的多的就是低频段(8-15Hz)
* 关于是不是需要去检测电脑屏幕真实的闪烁频率和程序是否一致，咨询之后回复是可以不用做，低频的只要在电脑自己刷新率之内的，基本是准的。


<details> <summary>💡正弦频率相位联合调制原理💡</summary>
正弦频率相位联合调制使用如下公式来确定每一个闪烁块在当前时刻的亮度： 

![img](https://cdn.jsdelivr.net/gh/Bu0717/image/imgclip_image002.gif)

其中，*s*为当前某个闪烁块的亮度，取值为0-1，对应0-255个亮度等级，*i*为当前屏幕的第几帧，*RefreshRate*为显示器的屏幕刷新率，一般为60Hz，根据显示器设置；*φ*是人为设计的某个闪烁刺激块的相位，单位为*π*；*f* 是人为设计的某个闪烁刺激块的闪烁频率，单位为 *Hz*。下图为正弦频率相位联合调制原理：

![image-20230105170049517](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230105170049517.png)

在项目中，使用38个闪烁刺激块来完成SSVEP的刺激器系统，利用`Psychtoolbox` `Matlab`工具箱完成设计，针对不同场景，最终设计的刺激器界面如下图所示：

* `SSVEP`拼写闪烁刺激器界面带频率相位信息

![image-20230105170745414](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230105170745414.png)

* `SSVEP`拼写软件(对应`SPELLER_PIN_XIE.m`)

![image-20230105170923833](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230105170923833.png)



*  `SSVEP`小车控制软件(对应`BCI_car_stimu.m`)

![image-20230105170947276](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230105170947276.png)
</details>

相关文献参考：

🐾[Sampled sinusoidal stimulation profile and multichannel fuzzy logic classification for monitor-based phase-coded SSVEP brain–computer interfacing - IOPscience](https://iopscience.iop.org/article/10.1088/1741-2560/10/3/036011)

🐾[A high-ITR SSVEP-based BCI speller: Brain-Computer Interfaces: Vol 1, No 3-4 (tandfonline.com)](https://www.tandfonline.com/doi/abs/10.1080/2326263X.2014.944469)

🐾[Generating Visual Flickers for Eliciting Robust Steady-State Visual Evoked Potentials at Flexible Frequencies Using Monitor Refresh Rate | PLOS ONE](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0099235)

🐾[High-speed spelling with a noninvasive brain–computer interface | PNAS](https://www.pnas.org/doi/full/10.1073/pnas.1508080112)

🐾[Filter bank canonical correlation analysis for implementing a high-speed SSVEP-based brain–computer interface - IOPscience](https://iopscience.iop.org/article/10.1088/1741-2560/12/4/046008)
***
## 🏃‍♂️刺激器代码运行

在掌握了`SSVEP`的基本原理后，我们就可以使用`Psychtoolbox`开始设计自己的刺激器。由于在代码包中（**[`matlab_stimulator`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_stimulator)**）我们提供了详细的程序注释，所以就不再做过多的程序介绍。大家直接运行**[`matlab_stimulator`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/tree/main/matlab_stimulator)**中的[`BCI_car_stimu.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_stimulator/BCI_car_stimu.m),[`SPELLER_PIN_XIE.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_stimulator/SPELLER_PIN_XIE.m)以及[`flicker.m`](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/matlab_stimulator/flicker.m)即可。

🤺🤺🤺注意，运行该程序前一定要安装好[**`Psychtoolbox安装`**](
