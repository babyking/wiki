---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 批量顺序copy字符串
date: 2020-03-25 08:47
category: Mac
tags: [alfred,工具,技巧]
---



经常会有这样的场景,我在一个软件里需要把n个字符串按顺序的copy到另一个软件里,通常的做法就是一个一个的copy,切换软件,粘贴,很麻烦.



Alfred里的粘贴板历史可以很好的解决这个问题.



比如说有三个字符串.  `one` `two` `three`  

先按顺序对这三个字符进行copy,这样粘贴板的历史里就有了这3个数据了.

![image-20200325091342756](../assets/blog/image-20200325091342756.png)

在需要paste的场景热键激活粘贴板历史,按图示中第一个出现的one的对应的快捷键 `⌘4`,后面依然按同样的键`⌘4`,会依次paste `two` `three`. 每次粘贴后alfred会自己调整数据顺序,刚好可以使用同样的快捷键依次paste不同的数据.

![image-20200325091310873](../assets/blog/image-20200325091310873.png)



![image-20200325091426095](../assets/blog/image-20200325091426095.png)

![image-20200325091515244](../assets/blog/image-20200325091515244.png)



