---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 制作DMG安装盘
date: 2019-10-31 14:23
category: 技术
tags: [mac,开发]
---



制作DMG安装盘共三个步骤

1. 创建空白DMG,将.app文件copy到DMG文件中

2. 转换压缩
3. 使用bless设置,使之双击打开为一个独立的窗口.



## 创建DMG

打开磁盘工具,创建空的dmg文件,partition设置为 CD/DVD

![screenshot_20191022_141523 27](../assets/blog/screenshot_2019_1031_0435_01.png)



![screenshot_20191022_141523 30](../assets/blog/screenshot_2019_1031_0435_28.png)

打开创建的DMG文件,将.app应用程序copy至打开的盘,创建 /Applications 的alias,并把其也copy到这里.



![screenshot_20191022_141523 31](../assets/blog/screenshot_2019_1031_0435_43.png)

应该是这个样子

![screenshot_20191022_141523 35](../assets/blog/screenshot_2019_1031_0435_57.png)

然后设置显示选项



![screenshot_20191022_141523 36](../assets/blog/screenshot_2019_1031_0436_10.png)

设置图标显示的大小,同时将准备好的背景图拖拽到里面,并设置APP图标和Application别名的位置 ,使之与背景图贴合.

![screenshot_20191022_141523 39](../assets/blog/screenshot_2019_1031_0436_23.png)

设置完了应该是这个样子.

![screenshot_20191022_141523 40](../assets/blog/screenshot_2019_1031_0436_37.png)

接下来就把这个盘先关闭,下面进行格式转换.



## 格式转换



## 						![screenshot_2019](../assets/blog/screenshot_2019-2505059.png)

![screenshot_2019](../assets/blog/screenshot_20191022_141.png)

## 设置

使用bless设置启动盘,使之打开始弹出窗口,显示在最上面.

```sh
bless --openfolder /Volumes/Untitled
```

![screenshot_20191022_14152](../assets/blog/screenshot_20191022_14152.png)