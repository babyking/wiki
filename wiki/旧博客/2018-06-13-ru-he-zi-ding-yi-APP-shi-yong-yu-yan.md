---
typora-root-url: ../
typora-copy-images-to: ../image
layout:     post
title:        指定APP启动默认语言
date:       2017-03-11 
category: Mac
tags: mac
---

macOS下应用程序的界面语言使用的是系统默认语言.我自己使用的默认的语言是英文,但对于像logic pro这样的应用,想要其默认使用中文该怎么办?



终端输入

```shell
$ defaults write com.apple.logic10 AppleLanguages '(zh-CN)'
```

其中 com.apple.logic10 是Logic Pro X 应用的bundle ID. 可以通过mdls命令获取.

```shell
$ mdls -name kMDItemCFBundleIdentifier [应用程序路径]
```



如果你只是临时使用的话,可以通过终端来启动APP

```shell
$ open -a /Applications/Logic\ Pro\ X.app --args -AppleLanguages '(zh-CN)' 
```



也可以通过一款叫  [Language Switcher](http://www.tj-hd.co.uk/downloads/Language_Switcher_1_1_7.dmg) 的APP来实现同样的功能.

![2018-06-13-22-31-36](../assets/blog/2018-06-13-22-31-36.jpg)

