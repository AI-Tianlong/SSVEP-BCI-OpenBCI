# OpenBCI安装🤔

## ☀️OpenBCI介绍

`OpenBCI `是美国`OpenBCI `公司向开发者开源的一款上位机软件，可以控制放大器 8 个通道的各个放大倍数，以及是否使用偏置电压，滤波器等功能，并可实现各个通道时间序列信号的可视化显示以及时间序列对应的频谱的可视化显示。并含有 LSL 小部件，可以通过 LSL 将采集到的数据实时传输给Matlab、Python 程序内，以供后续的在线分析对数据进行实时处理。

您可以通过浏览[官网](https://openbci.com/)和[文档](https://docs.openbci.com/)来实现对OPENBCI的更多了解。您还可以通过[Github](https://github.com/OpenBCI/OpenBCI_GUI)来参与到`OpenBCI `的社区开发。

   👉[OpenBCI官方网站](https://openbci.com/)

   👉[OpenBCI文档](https://docs.openbci.com/)

   👉[OpenBCI官方Github](https://github.com/OpenBCI/OpenBCI_GUI)

## 📥OpenBCI下载

脑电信号的硬件采集设备主要采用`BCIduino`，可以关注B站[**BCIduino脑机接口社区**](https://space.bilibili.com/424504556)，其主页提供了大量的教学视频。

我们需要准备好`Processing` ，`Openbci_hub`、`openbci_gui`三个软件。

需要提前说明的是，整个的运行步骤必须遵守下图。

```mermaid
graph LR
Processing ==> OpenBCIHub ==> openbci_gui
```

   👀[BCIduino放大器驱动和软件配置](https://www.bilibili.com/read/cv4349368?spm_id_from=333.999.0.0)

   👀[BCIduino基础教程-1-安装HUB](https://www.bilibili.com/video/BV17r4y1c74b/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

   👀[BCIduino基础教程-2-安装Processing](bilibili.com/video/BV1Bi4y1V79o/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

   👀[BCIduino基础教程-3-导入Processing库](https://www.bilibili.com/video/BV1jr4y1c73q/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

## 🗃️OpenBCI使用

安装完所需软件后，接下来就可以直接运行软件了，注意必须先打开`Openbci_hub`，再去运行`openbci_gui`

​    🌞[BCIduino基础教程-4-连接BCIduino蓝牙](https://www.bilibili.com/video/BV1kD4y1X7CY/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    🌞[BCIduino基础教程-5-连接BCIduino与OpenBCI_GUI](https://www.bilibili.com/video/BV1xy4y1q7te/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    🌞[BCIduino基础教程-6-传输脑电数据到Python（1）](https://www.bilibili.com/video/BV1E54y167gF/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    🌞[BCIduino基础教程-6-传输脑电数据到Python（2）](https://www.bilibili.com/video/BV1gt4y1Y7ri/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

***

​    💻[BCIduino PYLSL基础教程-1](https://www.bilibili.com/video/BV1xD4y1X7xo/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    💻[BCIduino PYLSL基础教程-2](https://www.bilibili.com/video/BV1of4y1v7P7/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    💻[BCIduino PYLSL基础教程-3](https://www.bilibili.com/video/BV1QK4y1j77Z/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    💻[BCIduino PYLSL基础教程-4](https://www.bilibili.com/video/BV15K4y1776Y/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    💻[BCIduino PYLSL基础教程-5](https://www.bilibili.com/video/BV1W54y167QZ/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

***

​    📜[BCIduino GUI基础教程-1](https://www.bilibili.com/video/BV1ea411w7UF/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    📜[BCIduino GUI基础教程-2](https://www.bilibili.com/video/BV11V411a79c/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    📜[BCIduino GUI基础教程-3](https://www.bilibili.com/video/BV1yA411x75Q/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)

​    📜[BCIduino GUI基础教程-4](https://www.bilibili.com/video/BV1pa4y1W7TE/?spm_id_from=333.999.0.0&vd_source=507a3507231db33770b846a9a609e78e)


