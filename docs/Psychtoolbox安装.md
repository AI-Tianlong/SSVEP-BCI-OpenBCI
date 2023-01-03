# Psychtoolbox安装📌

## 😶Psychtoolbox介绍

`Psychtoolbox`的功能是在`Matlab`与计算机硬件中间提供一个接口，让`Matlab`可以直接操纵计算机硬件。这样，我们就可以自由地要求计算机输出图像、文字或声音，精确计时并获取被试的反应。有了`Psychtoolbox`工具箱以后，用户可以在`Matlab`上完成几乎所有的实验工作。

💏 [Psychtoolbox官网](http://psychtoolbox.org/)

💏[Psychtoolbox官方介绍](http://psychtoolbox.org/overview.html)

## 😇Psychtoolbox下载

要想运行`Psychtoolbox`，需要下载`SVN`以及`gstreamer`。

🐢[SVN下载网址](https://sliksvn.com/download/)

🐢[gstreamer下载网址](https://gstreamer.freedesktop.org/download/)

🐢[Psychtoolbox下载网址](http://psychtoolbox.org/download.html)

下面是三个软件的安装步骤，大家可以参考进行安装。

  <details> <summary>🌏SVN安装</summary>
  为了安装PsychToolBox，它的版本控制程序Subversion是必须先要安装的,点击SVN的下载网址，然后选择对应的版本，进行下载安装。


  ![image-20230103160947031](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103160947031.png)

  解压之后，可以直接进行安装。

  ![image-20230103161413021](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103161413021.png)

  为了方便环境管理，我们可以新建一个Psychtoolbox文件夹，将所有环境安装到里面。点击Next，后面直接默认，至此SVN安装完成。

  ![image-20230103161750589](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103161750589.png)
  </details>

<details> <summary>🌘gstreamer安装</summary>
点击gstreamer下载网址，选择MSVC 1.20.5 runtime installer进行安装。

![image-20230103162417062](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103162417062.png)

点击安装包，直接进行安装，安装路径无需选择，直接点击Next。完成安装。

![image-20230103162713629](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103162713629.png)

![image-20230103162917602](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103162917602.png)
</details>

<details> <summary>🌚Psychtoolbox安装</summary>
点击Psychtoolbox的下载网址，选择Windows。

![image-20230103163312913](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103163312913.png)

点击下图所示的Subversion和MSVC的链接，下载并安装这两个软件。上面已经介绍过两个软件的安装方法，这里Psychtoolbox网址提供了详细的安装方法，可以进行参考。

![image-20230103163503656](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103163503656.png)

选择对应的版本后，点击Download PTB下载ZIP格式。

![image-20230103163849263](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103163849263.png)

下载Psychtoolbox到本地后，可以在上面建立过的Psychtoolbox文件夹中新建一个toolbox的文件夹，并将刚刚下载好的Psychtoolbox压缩文件解压至这个文件夹。

![image-20230103164603159](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103164603159.png)

可以发现解压过后的文件夹为Psychtoolbox-3-Psychtoolbox-3-c020ad7，我只需要将该文件夹的文件全部放到toolbox里面，然后删除Psychtoolbox-3-Psychtoolbox-3-c020ad7文件夹。

![image-20230103164738879](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103164738879.png)

紧接着打开Matlab，在命令行窗口输入如下两行代码即可（其中第一行改为你的“toolbox”文件夹的地址）

```matlab
>> cd E:\SSVEPenvironment\Psychtoolbox\toolbox\Psychtoolbox
>> SetupPsychtoolbox
```

等待安装，过程中需要根据程序提示点击几次“enter”键，看到“Enjoy！”，则说明安装成功了， 一般一两分钟就能安装好了。

![image-20230103165225765](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103165225765.png)

输入PsychtoolboxVersion或者Screen，出现如下代码，则说明安装成功。

![image-20230103165352965](https://cdn.jsdelivr.net/gh/Bu0717/image/imgimage-20230103165352965.png)
</details>

至此`Psychtoolbox`安装完成，下面我们会演示代码如何运行。

***

下面是网上的一些安装教程，大家可以一起食用。

🍥[Matlab+PsychToolBox=最好の心理学实验程序开发工具 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/60621225)

🍥[【MATLAB】Psychtoolbox的安装方法 - 简书 (jianshu.com)](https://www.jianshu.com/p/c8cd1fc46430)

🍥[Psychtoolbox-3安装步骤_Aimee@的博客-CSDN博客_psychtoolbox安装](https://blog.csdn.net/weixin_43691072/article/details/108088413?utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-3.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-3.control)

## 😍Psychtoolbox使用
