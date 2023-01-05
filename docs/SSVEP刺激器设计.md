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
