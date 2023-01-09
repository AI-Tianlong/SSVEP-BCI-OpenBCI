## 该文件夹包含闪烁刺激器的程序，使用前需要先安装matlab psychtoolbox3  
psychtoolbox安装教程可查看这里[psychtoolbox安装教程](https://zhuanlan.zhihu.com/p/369771024)  
该刺激器设计是基于正弦频率相位联合调制的方式设计的，可参考以下相关文献：  
https://iopscience.iop.org/article/10.1088/1741-2560/10/3/036011
## 文件说明
### 注意！该刺激器的设计有问题，闪烁可能不准。。:)
* `BCI_car_stimu.m`是具有四个闪烁目标的刺激器，分别以8Hz、10Hz、12Hz、14Hz闪烁，可通过修改代码来修改闪烁刺激的频率，非常的简单，找到8，10，12，14修改参数即可！
* `SPELLER_PIN_XIE.m`是具有38个闪烁目标的刺激器。用于脑控打字！频率从8.0Hz到15.4Hz，间隔0.2Hz。
* `flicker.m`是用来生成每一帧对应的闪烁块的亮度的(0-255)，`BCI_car_stimu.m`通过调用该函数来完成对应的闪烁块显示。
### 不是很理解的话，需要先去简单的学习一下Psychtoolbox，可以参考以下书籍：
* `psychtoolbox教程`在文件夹内给出了附件  
* `心理学研究方法：基于MATLAB和PSYCHTOOLBOX `支持大家购买正版书籍！  
* `PsychToolBox工具箱及Matlab编程实例`支持大家购买正版书籍！

