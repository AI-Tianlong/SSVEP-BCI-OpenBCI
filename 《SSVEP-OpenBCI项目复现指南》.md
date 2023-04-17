# 《SSVEP-BCI-OpenBCI项目复现指南》🌸

![](https://img.shields.io/badge/keywords-BCI%2CSSVEP%2CEEG-green)

**希望您在食用该项目前，观看我们提供的演示视频。我们希望该段视频能吸引您的兴趣，让您提前了解到我们做了什么，做的效果！！！**(其中包含了实验器材介绍，脑电帽的佩戴，以及脑控效果演示(包含：脑控打字拼写，脑控智能车，脑控智能家居)。)

**为了保护视频中的隐私，以及参试人员的信息，暂时不方便公开，如感兴趣，可以直接联系项目管理员，说明意图，方可对私人提供。注意不允许对其进行商业化行为！不可以对其进行恶意剪辑！不可以公开！！！**

🫱[**~~SSVEP-OpenBCI项目演示视频~~**]()🫲

***

关于该项目您有任何问题,可随时联系项目管理员：

[![ATL](https://img.shields.io/github/followers/AI-Tianlong?label=ATL-HIT&style=social)](https://github.com/AI-Tianlong)  [![ATL](https://img.shields.io/badge/ATL-07c160?style=for-the-badge&logo=wechat&logoColor=white)](https://github.com/AI-Tianlong)**全能最强选手！刺激器设计，信号处理**

[![BXL](https://img.shields.io/github/followers/Bu0717?label=BXL-UCAS&style=social)](https://github.com/Bu0717)  [![BXL](https://img.shields.io/badge/陌人不故-07c160?style=for-the-badge&logo=wechat&logoColor=white)](https://i.postimg.cc/cCZPX33y/mmqrcode1674647275960.png)**复现指南的编写，信号处理，项目组最菜**

[![LWL](https://img.shields.io/github/followers/lwlBCI?label=LWL-NUC&style=social)](https://github.com/lwlBCI)  [![LWL](https://img.shields.io/badge/RusswestDG-07c160?style=for-the-badge&logo=wechat&logoColor=white)]()**脑电信号处理大神！！！**

[![ZZH](https://img.shields.io/github/followers/HITzihao?label=ZZH-HIT&style=social)](https://github.com/HITzihao)  [![ZZH](https://img.shields.io/badge/浩浩-07c160?style=for-the-badge&logo=wechat&logoColor=white)](https://i.postimg.cc/rz2shQJy/mmexport1674647395044.jpg)**硬件大佬！！！**

***

## 🤓SSVEP-OpenBCI项目介绍

+ 🎊[**项目简介**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E9%A1%B9%E7%9B%AE%E7%AE%80%E4%BB%8B.md)
+ 🎡[**方案总结设计概述**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E6%96%B9%E6%A1%88%E6%80%BB%E7%BB%93%E8%AE%BE%E8%AE%A1%E6%A6%82%E8%BF%B0.md)
+ 🎯[**项目创新优势**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E9%A1%B9%E7%9B%AE%E5%88%9B%E6%96%B0%E4%BC%98%E5%8A%BF.md)
+ ✌️[**项目设计难点**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E9%A1%B9%E7%9B%AE%E8%AE%BE%E8%AE%A1%E9%9A%BE%E7%82%B9.md)

## 🧭 复现导航

+ 🔍[**OPENBCI安装**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/OPENBCI%E5%AE%89%E8%A3%85.md)
+ 🔧[**Psychtoolbox安装**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/Psychtoolbox%E5%AE%89%E8%A3%85.md)
+ 🐵[**SSVEP刺激器设计**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/SSVEP%E5%88%BA%E6%BF%80%E5%99%A8%E8%AE%BE%E8%AE%A1.md)
+ 🦄[**信号处理设计（一）—脑电信号的采集**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E4%BF%A1%E5%8F%B7%E5%A4%84%E7%90%86%E8%AE%BE%E8%AE%A1%EF%BC%88%E4%B8%80%EF%BC%89%E2%80%94%E8%84%91%E7%94%B5%E4%BF%A1%E5%8F%B7%E7%9A%84%E9%87%87%E9%9B%86.md)
+ 💞[**信号处理设计（二）—脑电信号的处理(代码分析)**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E4%BF%A1%E5%8F%B7%E5%A4%84%E7%90%86%E8%AE%BE%E8%AE%A1%EF%BC%88%E4%BA%8C%EF%BC%89%E2%80%94%E8%84%91%E7%94%B5%E4%BF%A1%E5%8F%B7%E7%9A%84%E5%A4%84%E7%90%86.md)
+ 🏄[**信号处理设计（三）—脑电信号分析结果**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E4%BF%A1%E5%8F%B7%E5%A4%84%E7%90%86%E8%AE%BE%E8%AE%A1%EF%BC%88%E4%B8%89%EF%BC%89%E2%80%94%E8%84%91%E7%94%B5%E4%BF%A1%E5%8F%B7%E5%88%86%E6%9E%90%E7%BB%93%E6%9E%9C.md)

## 🍓 总结及演示

* 🍄[**项目总结**](https://github.com/AI-Tianlong/SSVEP-BCI-OpenBCI/blob/main/docs/%E9%A1%B9%E7%9B%AE%E6%80%BB%E7%BB%93.md)
* 🌌[**系统效果图**](https://www.aliyundrive.com/s/cpGHuJ5taWY)

* 🔦[**~~SSVEP-OpenBCI项目演示视频~~**]()

* 🍧[~~**脑控抓取演示视频**~~]()

* 🎌[~~**摄像头抓取演示视频**~~]()

<center>我是分割线👉👉👉此项目文档后续会不定期更新完善</center>

***





