---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: fork vs source vs exec
date: 2019-10-14 10:28
category: Unix
tags: [shell]
---

fork,source,exec都可以用来执行shell脚本,他们区别如下



## fork

1. 产生新的进程
2. 复制当前(父)进程的环境
3. 执行完后,其环境不会影响当前(父)进程
4. fork后的两个进程各自独立运行.



## source

1. 不会产生新的进程
2. 继承当前进程的环境
3. 执行结束后,它的环境会被保留
4. 执行结束后,继续执行后面脚本



## exec

1. 产生新的进程
2. 占用当前进程的环境(包括PID)
3. 执行结束后,原有进程不再执行(相当于替换了原有进程的内容)



使用场景不同,source经常用于修改了bashrc配置文件并让其生效.