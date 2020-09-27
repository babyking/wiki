---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Duet2罢工了
date: 2018-10-21 20:58
category: 音乐
tags: [apogee,声卡]
---



> 问题终于解决,详见文末.



Macbook 重装系统(High Serria)后,  Duet2声卡 罢工了,驱动版本2.5`duet_2.5.dmg`

电脑启动后不停的提示需要更新固件,但更新程序显示固件的版本是最新的.

![Xnip2018-10-21_20-55-02](../assets/blog/Xnip2018-10-21_20-55-02.jpg)

Apogee Maestro面板也找不到设备,声卡的液晶屏显示apogee的logo,不能正常工作.

![Xnip2018-10-11_22-29-11](../assets/blog/Xnip2018-10-11_22-29-11.jpg)

网上搜索无果.但我的另一台2014年Macbook倒是工作正常,macOS版本也是High Serria,这台macbook的操作系统是从老版本连续升级过来的,Apogee Maestro版本为`2.10.6`,而最新`duet_2.5.dmg` 的Maestro驱动对应的版本是`2.10.9` (驱动版本与控制程序版本是分开的)



![Snip20181021_1](../assets/blog/Snip20181021_1.png)

顺着这个思路,是不是找到`2.10.6`对应的驱动是否就好了, 可惜官网似乎无法找到对应的版本了.



挖个坑,解决了再来填.



## 问题解决

google, youtube,论坛各种搜索,发现2个跟我情况一模一样的

1.Youtube

[Apogee Duet 2 Not Working/Connecting](https://www.youtube.com/watch?v=wca40hU8mxI&list=LLQYMzCEEC8Or65JVMsg6Ktw&index=2&t=24s)

2.Tonymacx86.com

[Apogee Maestro / Duet2 not working on Sierra Hackintosh](https://www.tonymacx86.com/threads/apogee-maestro-duet2-not-working-on-sierra-hackintosh.207988/)

但评论区似乎都没有解决方案.



我的两台电脑有一台能工作且能工作的电脑的驱动比较老,所以一直都把问题归结为新版本的驱动问题,在[音频应用](http://audiobar.cn)上也有朋友给了几个老版本的驱动,问题依然没有解决.

周日,突然想到声卡无法工作的这台MacBookPro笔记本有重装过,且当时安装时把文件系统设置为了大小写敏感.

因为自己平时偶尔写一些程序要部署到大小写敏感的Linux上,就顺手干了这事. 脑洞一开,会不会是这个导致呢?



​	1.重装OSX 10.11 , 默认安装(文件系统不区分大小写),安装驱动,问题解决.

​	2.从10.11升级至10.13,工作正常.

​	3.直接默认重装macOS 10.13,安装duet2驱动,工作正常.



原来真是这个问题.  Apogee Duet的驱动在大小写敏感的文件系统上无法正常工作,说是驱动的兼容性问题也没毛病.



Duet 复活了,终于可以下单 Generic 8010A 了,期待....



