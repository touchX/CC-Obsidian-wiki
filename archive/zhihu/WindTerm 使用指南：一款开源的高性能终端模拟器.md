---
title: "WindTerm 使用指南：一款开源的高性能终端模拟器"
source: "https://zhuanlan.zhihu.com/p/564584941"
created: 2026-05-08
description: "文章首发于个人公号：阿拉平平我之前分享过一个开源的终端模拟器：Tabby。这个模拟器颜值颇高，又具备高度定制化的功能，支持插件以及自定义配色。不过有小伙伴向我吐槽，Tabby 虽好，但是基于 Electron 开发的软…"
tags:
  - "zhihu"
  - "clippings"
---
10 人赞同了该文章

> 文章首发于个人公号：阿拉平平

我之前分享过一个开源的终端模拟器： [Tabby](https://zhida.zhihu.com/search?content_id=213595568&content_type=Article&match_order=1&q=Tabby&zhida_source=entity) 。这个模拟器颜值颇高，又具备高度定制化的功能，支持插件以及自定义配色。不过有小伙伴向我吐槽，Tabby 虽好，但是基于 [Electron](https://zhida.zhihu.com/search?content_id=213595568&content_type=Article&match_order=1&q=Electron&zhida_source=entity) 开发的软件，难免会有体积大和启动慢的问题。有没有其它开源又好用的终端模拟器呢？

## 项目介绍

WindTerm [^1] 是一个基于 C 开发的开源终端模拟器，支持跨平台运行。相较于其它主流的终端工具，WindTerm 具有更好的性能表现。本文将介绍 WindTerm 的基本用法和功能。

## 下载安装

目前 WindTerm 最新版本为 2.5.0，可以从官网、GitHub 或者到公号后台回复 `windterm` 获取。

软件解压即用，运行后的界面如下：

![](https://pic3.zhimg.com/v2-f036fad141ad8701554510c455532468_1440w.jpg)

## 使用说明

本章将介绍 WindTerm 的基本用法和特色功能，包括：

### 调整窗格

WindTerm 的界面有些复杂，左右侧分别集成了资源管理、文件管理器、会话以及历史命令。我自己倾向于关闭这些窗格，让界面更简洁一些，关闭后效果如下：

![](https://picx.zhimg.com/v2-0e0971277faecf0bf16c8879986df0d3_1440w.jpg)

如果需要这些窗格，可以到『查看』→『窗格』来开启。

![](https://picx.zhimg.com/v2-6a294ae87e4e5b793a8b81ca8816891b_1440w.jpg)

### 新建会话

在调整窗格后，我们新建一个会话来连接服务器。

点击『会话』→『新建会话』打开会话配置界面，填写连接信息。

![](https://pic2.zhimg.com/v2-855dca0d8947b35a2e0c5973e620b7f7_1440w.jpg)

填好主机地址后，点击连接，再输入用户名和密码。如果信息无误，则可正常连接。

![](https://pic4.zhimg.com/v2-5b6a3fb815f1fcafc32f272d444fabcf_1440w.jpg)

### 文件传输

WindTerm 集成了 [SFTP](https://zhida.zhihu.com/search?content_id=213595568&content_type=Article&match_order=1&q=SFTP&zhida_source=entity) 传输功能，打开『文件管理器』窗格，可以将文件直接拖曳到目录下。

![动图封面](https://pic3.zhimg.com/v2-dc9e9a6691a0e385a4814ff586bd11b0_b.jpg)

而对于大文件，可以将『使用高速传输』选项勾上来提升传输速度：

![](https://pic3.zhimg.com/v2-4cc5d3a837428fead65a960a93c7e15e_1440w.jpg)

### 命令提示与补全

我们在终端输入命令时，有时会忘记参数，WindTerm 的命令提示和补全功能就非常实用了。

![动图封面](https://pic3.zhimg.com/v2-01921b344c2c275735fc106be838e42a_b.jpg)

此外，我还发现 WindTerm 可以将显示的结果折叠起来，这在会回看记录时会变得很有用。

![](https://pic2.zhimg.com/v2-6c2a68b3661cf2d3e74610e8b83edf97_1440w.jpg)

### 锁屏

当我们长时间不去操作终端时，WindTerm 会进入锁屏状态，默认是 30 分钟。

![](https://pic3.zhimg.com/v2-794a21e098ef3484d6858b18c922a824_1440w.jpg)

由于我们没有设置过密码，这里直接回车即可。如果需要关闭该功能，可以到『会话』→『首选项』→『设置』→『安全』，将锁屏超时时间改为 0 分钟。

![](https://pic3.zhimg.com/v2-4943b7e888d8cfa8ab2721021ad98e76_1440w.jpg)

## 写在最后

总的来说，WindTerm 给我的体验非常好，有需要的小伙伴不妨尝试下。限于篇幅，我这里只做了一些简单介绍，更多的使用技巧可以参考这个网站 [^2] \[2\] 。

## 参考

发布于 2022-09-15 10:40

[^1]: WindTerm [https://github.com/kingToolbox/WindTerm](https://github.com/kingToolbox/WindTerm)

[^2]: 网站 [https://kingtoolbox.github.io/](https://kingtoolbox.github.io/)